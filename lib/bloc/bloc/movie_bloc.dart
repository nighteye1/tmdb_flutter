import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb_app/data/app_db.dart';
import 'package:tmdb_app/model/movie_detail_model.dart';
import 'package:tmdb_app/model/upcoming_movie_model.dart';
import 'package:tmdb_app/networking/api_response.dart';
import 'package:tmdb_app/repositories/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository = MovieRepository();
  final MyDatabase myDatabase = MyDatabase();

  MovieBloc() : super(MovieInitial()) {
    on<GetUpcomingMovieEvent>((event, emit) async {
      emit(LoadingMoviesState());

      ApiResponse response = await _movieRepository.getUpcomingMovies();

      if (response.status == Status.success) {
        emit(
          MoviesFetchedSuccessState(
            upcomingMovies: List.from(response.data['results'])
                .map((e) => UpcomingMovieModel.fromJson(e))
                .toList(),
          ),
        );
      } else {
        emit(
          MoviesFetchedFailureState(
            message: response.message ?? 'something went wrong',
          ),
        );
      }
    });

    on<SearchMovieEvent>((event, emit) {
      if (event.search.isEmpty) {
        emit(SearchResultState(results: const []));
      } else {
        List<UpcomingMovieModel> results = event.upcomingMovies
            .where((element) => element.title
                .toLowerCase()
                .contains(event.search.toLowerCase()))
            .toList();
        emit(SearchResultState(results: results));
      }
    });

    on<GetMovieDetailEvent>((event, emit) async {
      emit(LoadingMovieDetailState());
      ApiResponse response = await _movieRepository.getMovieDetails(
        movieId: event.movieId,
      );

      if (response.status == Status.success) {
        emit(MovieDetailFetchSuccessState(
            movieDetailModel: MovieDetailModel.fromJson(response.data)));
      } else {
        emit(MovieDetailFetchFailureState(
          message: response.message ?? 'something went wrong',
        ));
      }
    });
  }
}
