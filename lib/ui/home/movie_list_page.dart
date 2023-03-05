import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/bloc/bloc/movie_bloc.dart';
import 'package:tmdb_app/ui/components/app_search_field.dart';
import 'package:tmdb_app/ui/components/search_movie_box.dart';
import 'package:tmdb_app/ui/home/results_page.dart';
import 'package:tmdb_app/ui/movie/movie_detail.dart';
import 'package:tmdb_app/utils/app_colors.dart';

import '../../model/upcoming_movie_model.dart';
import '../components/movie_box.dart';
import '../components/poppins_style.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late MovieBloc movieBloc;
  List<UpcomingMovieModel> upcomingMovies = [];
  List<UpcomingMovieModel> filteredMovies = [];
  int page = 1;

  bool showSearch = false;
  bool showResultsPage = false;

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchNode = FocusNode();

  @override
  void initState() {
    movieBloc = BlocProvider.of<MovieBloc>(context);
    movieBloc.add(GetUpcomingMovieEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: movieBloc,
      listener: (context, state) {
        if (state is MoviesFetchedSuccessState) {
          upcomingMovies.addAll(state.upcomingMovies);
        }

        if (state is SearchResultState) {
          filteredMovies = [...state.results];
        }
      },
      builder: (context, state) {
        return showResultsPage
            ? ResultsPage(
                results: filteredMovies,
                onBackTap: () {
                  setState(() {
                    filteredMovies.clear();
                    showResultsPage = false;
                  });
                },
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 22.w,
                          left: 22.w,
                          bottom: 24.h,
                          top: 24.h,
                        ),
                        child: showSearch
                            ? AppSearchField(
                                controller: searchController,
                                searchNode: searchNode,
                                onChange: (value) {
                                  movieBloc.add(SearchMovieEvent(
                                      search: value,
                                      upcomingMovies: upcomingMovies));
                                },
                                onClearTap: () {
                                  searchController.clear();
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  setState(() {
                                    showSearch = false;
                                  });
                                  filteredMovies.clear();
                                },
                                onDoneTap: (value) {
                                  searchController.clear();
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  setState(() {
                                    showSearch = false;
                                    showResultsPage = true;
                                  });
                                },
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Watch',
                                    style: poppinsStyle(
                                      fSize: 16.sp,
                                      fWeight: FontWeight.w500,
                                      fColor: const Color(0xFF202c43),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showSearch = true;
                                      });
                                      searchNode.requestFocus();
                                    },
                                    child: Icon(
                                      Icons.search_rounded,
                                      size: 16.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: filteredMovies.isNotEmpty,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: AppColors.lightGrey,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'Top Results',
                            style: poppinsStyle(
                              fWeight: FontWeight.w500,
                              fSize: 12.sp,
                              fColor: const Color(
                                0xFF202c43,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.11),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: state is MoviesFetchedFailureState
                        ? DecoratedBox(
                            decoration:
                                const BoxDecoration(color: AppColors.lightGrey),
                            child: Center(
                              child: Text(
                                state.message,
                                style: poppinsStyle(
                                  fSize: 16.sp,
                                  fWeight: FontWeight.w500,
                                  fColor: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : state is LoadingMoviesState
                            ? const DecoratedBox(
                                decoration:
                                    BoxDecoration(color: AppColors.lightGrey),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : DecoratedBox(
                                decoration: const BoxDecoration(
                                    color: AppColors.lightGrey),
                                child: ListView.builder(
                                  itemCount: filteredMovies.isEmpty
                                      ? upcomingMovies.length
                                      : filteredMovies.length,
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        filteredMovies.isNotEmpty ? 0.h : 30.h,
                                  ),
                                  itemBuilder: (ctx, index) {
                                    return filteredMovies.isEmpty
                                        ? MovieBox(
                                            movieName:
                                                upcomingMovies[index].title,
                                            moviePosterUrl:
                                                upcomingMovies[index]
                                                    .backdropPath!,
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetailPage(
                                                    upcomingMovieModel:
                                                        upcomingMovies[index],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : SearchMovieBox(
                                            upcomingMovieModel:
                                                filteredMovies[index],
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetailPage(
                                                    upcomingMovieModel:
                                                        filteredMovies[index],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                  },
                                ),
                              ),
                  ),
                ],
              );
      },
    );
  }
}
