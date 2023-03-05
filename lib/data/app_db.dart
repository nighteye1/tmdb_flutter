import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_db.g.dart';

@DataClassName('Movie')
class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer()();
  BoolColumn get isAdult => boolean().withDefault(const Constant(false))();
  TextColumn get backdropPath => text().nullable()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get homePage => text().nullable()();
  TextColumn get originalLanguage => text()();
  TextColumn get originalTitle => text()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  TextColumn get releaseDate => text()();
  IntColumn get runTime => integer()();
  TextColumn get status => text()();
}

@DataClassName('Genre')
class Genres extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer().references(Movies, #movieId)();
  IntColumn get genreId => integer()();
  TextColumn get name => text()();
}

@DataClassName('Video')
class Videos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer().references(Movies, #movieId)();
  TextColumn get name => text()();
  TextColumn get key => text()();
  TextColumn get site => text()();
  IntColumn get size => integer()();
  TextColumn get type => text()();
  BoolColumn get official => boolean().withDefault(const Constant(true))();
  TextColumn get videoId => text()();
}

@DriftDatabase(tables: [Movies, Genres, Videos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Movie>> get allMovies => select(movies).get();
  Future<List<Genre>> getMovieGenre(int movieId) {
    return (select(genres)..where((tbl) => tbl.movieId.equals(movieId))).get();
  }

  Future<List<Video>> getMovieVideos(int movieId) {
    return (select(videos)..where((tbl) => tbl.movieId.equals(movieId))).get();
  }

  Future insertMovie(Movie movie) => into(movies).insert(movie);
  Future insertVideo(Video video) => into(videos).insert(video);
  Future insertGenre(Genre genre) => into(genres).insert(genre);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
