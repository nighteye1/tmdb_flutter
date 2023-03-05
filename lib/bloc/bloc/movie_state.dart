part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class LoadingMoviesState extends MovieState {}

class MoviesFetchedSuccessState extends MovieState {
  final List<UpcomingMovieModel> upcomingMovies;
  MoviesFetchedSuccessState({required this.upcomingMovies});
}

class MoviesFetchedFailureState extends MovieState {
  final String message;
  MoviesFetchedFailureState({
    required this.message,
  });
}

class LoadingMovieDetailState extends MovieState {}

class MovieDetailFetchSuccessState extends MovieState {
  final MovieDetailModel movieDetailModel;
  MovieDetailFetchSuccessState({required this.movieDetailModel});
}

class MovieDetailFetchFailureState extends MovieState {
  final String message;
  MovieDetailFetchFailureState({required this.message});
}

class SearchResultState extends MovieState {
  final List<UpcomingMovieModel> results;
  SearchResultState({required this.results});
}
