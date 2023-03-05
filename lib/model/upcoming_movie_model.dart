class UpcomingMovieModel {
  String posterPath;
  bool isAdult;
  String overView;
  String releaseDate;
  List<int> genreIds;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  String? backdropPath;
  double popularity;
  int voteCount;
  bool isVideo;
  double voteAverage;

  UpcomingMovieModel({
    required this.id,
    this.backdropPath,
    required this.genreIds,
    required this.isAdult,
    required this.isVideo,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overView,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieModel(
      id: json['id'],
      genreIds: List.from(json['genre_ids']).map<int>((e) => e).toList(),
      isAdult: json['adult'],
      isVideo: json['video'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overView: json['overview'],
      popularity: json['popularity'],
      posterPath: 'https://image.tmdb.org/t/p/original/${json['poster_path']}',
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: (json['vote_average']).toDouble(),
      voteCount: json['vote_count'],
      backdropPath: json['backdrop_path'] != null
          ? 'https://image.tmdb.org/t/p/original/${json['backdrop_path']}'
          : null,
    );
  }
}
