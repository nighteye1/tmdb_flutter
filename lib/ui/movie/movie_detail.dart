import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/bloc/bloc/movie_bloc.dart';
import 'package:tmdb_app/model/movie_detail_model.dart';
import 'package:tmdb_app/model/upcoming_movie_model.dart';
import 'package:tmdb_app/ui/components/poppins_style.dart';
import 'package:tmdb_app/ui/movie/video_player_screen.dart';
import 'package:tmdb_app/utils/helper_functions.dart';

import '../../utils/app_colors.dart';
import '../components/genre_list.dart';

class MovieDetailPage extends StatefulWidget {
  final UpcomingMovieModel upcomingMovieModel;
  const MovieDetailPage({
    super.key,
    required this.upcomingMovieModel,
  });

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late MovieBloc movieBloc;

  MovieDetailModel movieDetailModel = MovieDetailModel(
    backdropPath: '',
    genres: [],
    id: -1,
    isAdult: false,
    isVideo: false,
    originalTitle: '',
    orirignalLanguage: '',
    overview: '',
    posterPath: '',
    releaseDate: '',
    runtime: -1,
    status: '',
    title: '',
    videos: [],
  );

  @override
  void initState() {
    movieBloc = BlocProvider.of<MovieBloc>(context);
    movieBloc.add(GetMovieDetailEvent(movieId: widget.upcomingMovieModel.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: movieBloc,
      listener: (context, state) {
        if (state is MovieDetailFetchSuccessState) {
          movieDetailModel = state.movieDetailModel;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl: widget.upcomingMovieModel.posterPath,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return const DecoratedBox(
                            decoration:
                                BoxDecoration(color: AppColors.lightGrey),
                            child: Center(
                              child: Icon(Icons.movie),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 24,
                      left: 24,
                      child: SafeArea(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            Text(
                              'Watch',
                              style: poppinsStyle(
                                fSize: 16.sp,
                                fWeight: FontWeight.w500,
                                fColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Positioned(
                      bottom: 100.h,
                      child: Column(
                        children: [
                          Text(
                            'In Theaters ${HelperFunctions.getHumanDate(widget.upcomingMovieModel.releaseDate)}',
                            style: poppinsStyle(
                              fSize: 16.sp,
                              fWeight: FontWeight.w500,
                              fColor: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 243.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.skyBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Get Tickets',
                              style: poppinsStyle(
                                fSize: 14.sp,
                                fWeight: FontWeight.w600,
                                fColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (state is LoadingMovieDetailState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Loading Data...',
                                    ),
                                  ),
                                );
                              } else {
                                int index = movieDetailModel.videos.indexWhere(
                                  (element) =>
                                      element.type == 'Trailer' &&
                                      element.site == 'YouTube',
                                );

                                if (index > -1) {
                                  VideoObject videoObject =
                                      movieDetailModel.videos[index];
                                  String trailerUrl =
                                      'https://www.youtube.com/watch?v=${videoObject.key}';
                                  log('url --- $trailerUrl');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => VideoPlayerScreen(
                                        videoUrl: trailerUrl,
                                        videoId: videoObject.key,
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Trailer not found',
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Container(
                              width: 243.w,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.skyBlue,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Watch Trailer',
                                    style: poppinsStyle(
                                      fSize: 14.sp,
                                      fWeight: FontWeight.w600,
                                      fColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 27.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Genres',
                    style: poppinsStyle(
                      fSize: 16.sp,
                      fWeight: FontWeight.w500,
                      fColor: const Color(0xFF202c43),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                SizedBox(
                  height: 30.h,
                  child: state is LoadingMovieDetailState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state is MovieDetailFetchFailureState
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'No genres found',
                                style: poppinsStyle(
                                  fSize: 12.sp,
                                  fWeight: FontWeight.w400,
                                  fColor: const Color(0xFF8f8f8f),
                                ),
                              ),
                            )
                          : GenreList(
                              genres: movieDetailModel.genres,
                            ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                  indent: 40,
                  endIndent: 40,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Overview',
                    style: poppinsStyle(
                      fSize: 16.sp,
                      fWeight: FontWeight.w500,
                      fColor: const Color(0xFF202c43),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    widget.upcomingMovieModel.overView,
                    style: poppinsStyle(
                      fSize: 12.sp,
                      fWeight: FontWeight.w400,
                      fColor: const Color(0xFF8f8f8f),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
