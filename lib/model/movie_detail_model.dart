
class MovieDetailModel {
  bool isAdult;
  String backdropPath;
  List<Genres> genres;
  String? homepage;
  int id;
  String orirignalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  int runtime;
  String status;
  String title;
  bool isVideo;
  List<VideoObject> videos;

  MovieDetailModel({
    required this.backdropPath,
    required this.genres,
    this.homepage,
    required this.id,
    required this.isAdult,
    required this.isVideo,
    required this.originalTitle,
    required this.orirignalLanguage,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.status,
    required this.title,
    required this.videos,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      backdropPath: json['backdrop_path'],
      genres: List.from(json['genres'])
          .map(
            (e) => Genres.fromJson(e),
          )
          .toList(),
      homepage: json['homepage'] ?? '',
      id: json['id'],
      isAdult: json['adult'],
      isVideo: json['video'],
      originalTitle: json['original_title'],
      orirignalLanguage: json['original_language'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      status: json['status'],
      title: json['status'],
      videos: List.from(json['videos']['results'])
          .map(
            (e) => VideoObject.fromJson(e),
          )
          .toList(),
    );
  }
}

class Genres {
  int id;
  String name;
  Genres({
    required this.id,
    required this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'],
      name: json['name'],
    );
  }
}

class VideoObject {
  String name;
  String key;
  String site;
  int size;
  String type;
  bool isOfficial;
  String id;

  VideoObject({
    required this.name,
    required this.id,
    required this.isOfficial,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
  });

  factory VideoObject.fromJson(Map<String, dynamic> json) {
    return VideoObject(
      name: json['name'],
      id: json['id'],
      isOfficial: json['official'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
    );
  }
}
