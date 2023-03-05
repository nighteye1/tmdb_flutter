part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class GetUpcomingMovieEvent extends MovieEvent {}

class GetMovieDetailEvent extends MovieEvent {
  final int movieId;
  GetMovieDetailEvent({
    required this.movieId,
  });
}

class SearchMovieEvent extends MovieEvent {
  final String search;
  final List<UpcomingMovieModel> upcomingMovies;
  SearchMovieEvent({
    required this.search,
    required this.upcomingMovies,
  });
}
