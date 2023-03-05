// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _movieIdMeta =
      const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int> movieId = GeneratedColumn<int>(
      'movie_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isAdultMeta =
      const VerificationMeta('isAdult');
  @override
  late final GeneratedColumn<bool> isAdult =
      GeneratedColumn<bool>('is_adult', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_adult" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _posterPathMeta =
      const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _homePageMeta =
      const VerificationMeta('homePage');
  @override
  late final GeneratedColumn<String> homePage = GeneratedColumn<String>(
      'home_page', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  @override
  late final GeneratedColumn<String> originalLanguage = GeneratedColumn<String>(
      'original_language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _runTimeMeta =
      const VerificationMeta('runTime');
  @override
  late final GeneratedColumn<int> runTime = GeneratedColumn<int>(
      'run_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        movieId,
        isAdult,
        backdropPath,
        posterPath,
        homePage,
        originalLanguage,
        originalTitle,
        title,
        overview,
        releaseDate,
        runTime,
        status
      ];
  @override
  String get aliasedName => _alias ?? 'movies';
  @override
  String get actualTableName => 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('is_adult')) {
      context.handle(_isAdultMeta,
          isAdult.isAcceptableOrUnknown(data['is_adult']!, _isAdultMeta));
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    }
    if (data.containsKey('home_page')) {
      context.handle(_homePageMeta,
          homePage.isAcceptableOrUnknown(data['home_page']!, _homePageMeta));
    }
    if (data.containsKey('original_language')) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableOrUnknown(
              data['original_language']!, _originalLanguageMeta));
    } else if (isInserting) {
      context.missing(_originalLanguageMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    } else if (isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('run_time')) {
      context.handle(_runTimeMeta,
          runTime.isAcceptableOrUnknown(data['run_time']!, _runTimeMeta));
    } else if (isInserting) {
      context.missing(_runTimeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Movie(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      movieId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movie_id'])!,
      isAdult: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_adult'])!,
      backdropPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path']),
      posterPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path']),
      homePage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}home_page']),
      originalLanguage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}original_language'])!,
      originalTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_title'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
      runTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}run_time'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(attachedDatabase, alias);
  }
}

class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final int movieId;
  final bool isAdult;
  final String? backdropPath;
  final String? posterPath;
  final String? homePage;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String status;
  const Movie(
      {required this.id,
      required this.movieId,
      required this.isAdult,
      this.backdropPath,
      this.posterPath,
      this.homePage,
      required this.originalLanguage,
      required this.originalTitle,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.runTime,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['movie_id'] = Variable<int>(movieId);
    map['is_adult'] = Variable<bool>(isAdult);
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || homePage != null) {
      map['home_page'] = Variable<String>(homePage);
    }
    map['original_language'] = Variable<String>(originalLanguage);
    map['original_title'] = Variable<String>(originalTitle);
    map['title'] = Variable<String>(title);
    map['overview'] = Variable<String>(overview);
    map['release_date'] = Variable<String>(releaseDate);
    map['run_time'] = Variable<int>(runTime);
    map['status'] = Variable<String>(status);
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: Value(id),
      movieId: Value(movieId),
      isAdult: Value(isAdult),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      homePage: homePage == null && nullToAbsent
          ? const Value.absent()
          : Value(homePage),
      originalLanguage: Value(originalLanguage),
      originalTitle: Value(originalTitle),
      title: Value(title),
      overview: Value(overview),
      releaseDate: Value(releaseDate),
      runTime: Value(runTime),
      status: Value(status),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      movieId: serializer.fromJson<int>(json['id']),
      isAdult: serializer.fromJson<bool>(json['adult']),
      backdropPath: serializer.fromJson<String?>(json['backdrop_path']),
      posterPath: serializer.fromJson<String?>(json['poster_path']),
      homePage: serializer.fromJson<String?>(json['home_page']),
      originalLanguage: serializer.fromJson<String>(json['original_language']),
      originalTitle: serializer.fromJson<String>(json['original_title']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['release_date']),
      runTime: serializer.fromJson<int>(json['run_time']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'movieId': serializer.toJson<int>(movieId),
      'isAdult': serializer.toJson<bool>(isAdult),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'posterPath': serializer.toJson<String?>(posterPath),
      'homePage': serializer.toJson<String?>(homePage),
      'originalLanguage': serializer.toJson<String>(originalLanguage),
      'originalTitle': serializer.toJson<String>(originalTitle),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'runTime': serializer.toJson<int>(runTime),
      'status': serializer.toJson<String>(status),
    };
  }

  Movie copyWith(
          {int? id,
          int? movieId,
          bool? isAdult,
          Value<String?> backdropPath = const Value.absent(),
          Value<String?> posterPath = const Value.absent(),
          Value<String?> homePage = const Value.absent(),
          String? originalLanguage,
          String? originalTitle,
          String? title,
          String? overview,
          String? releaseDate,
          int? runTime,
          String? status}) =>
      Movie(
        id: id ?? this.id,
        movieId: movieId ?? this.movieId,
        isAdult: isAdult ?? this.isAdult,
        backdropPath:
            backdropPath.present ? backdropPath.value : this.backdropPath,
        posterPath: posterPath.present ? posterPath.value : this.posterPath,
        homePage: homePage.present ? homePage.value : this.homePage,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        runTime: runTime ?? this.runTime,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('isAdult: $isAdult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('posterPath: $posterPath, ')
          ..write('homePage: $homePage, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('runTime: $runTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      movieId,
      isAdult,
      backdropPath,
      posterPath,
      homePage,
      originalLanguage,
      originalTitle,
      title,
      overview,
      releaseDate,
      runTime,
      status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.movieId == this.movieId &&
          other.isAdult == this.isAdult &&
          other.backdropPath == this.backdropPath &&
          other.posterPath == this.posterPath &&
          other.homePage == this.homePage &&
          other.originalLanguage == this.originalLanguage &&
          other.originalTitle == this.originalTitle &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.releaseDate == this.releaseDate &&
          other.runTime == this.runTime &&
          other.status == this.status);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<int> movieId;
  final Value<bool> isAdult;
  final Value<String?> backdropPath;
  final Value<String?> posterPath;
  final Value<String?> homePage;
  final Value<String> originalLanguage;
  final Value<String> originalTitle;
  final Value<String> title;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<int> runTime;
  final Value<String> status;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.isAdult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.homePage = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.runTime = const Value.absent(),
    this.status = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    required int movieId,
    this.isAdult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.homePage = const Value.absent(),
    required String originalLanguage,
    required String originalTitle,
    required String title,
    required String overview,
    required String releaseDate,
    required int runTime,
    required String status,
  })  : movieId = Value(movieId),
        originalLanguage = Value(originalLanguage),
        originalTitle = Value(originalTitle),
        title = Value(title),
        overview = Value(overview),
        releaseDate = Value(releaseDate),
        runTime = Value(runTime),
        status = Value(status);
  static Insertable<Movie> custom({
    Expression<int>? id,
    Expression<int>? movieId,
    Expression<bool>? isAdult,
    Expression<String>? backdropPath,
    Expression<String>? posterPath,
    Expression<String>? homePage,
    Expression<String>? originalLanguage,
    Expression<String>? originalTitle,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String>? releaseDate,
    Expression<int>? runTime,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movieId != null) 'movie_id': movieId,
      if (isAdult != null) 'is_adult': isAdult,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (posterPath != null) 'poster_path': posterPath,
      if (homePage != null) 'home_page': homePage,
      if (originalLanguage != null) 'original_language': originalLanguage,
      if (originalTitle != null) 'original_title': originalTitle,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
      if (runTime != null) 'run_time': runTime,
      if (status != null) 'status': status,
    });
  }

  MoviesCompanion copyWith(
      {Value<int>? id,
      Value<int>? movieId,
      Value<bool>? isAdult,
      Value<String?>? backdropPath,
      Value<String?>? posterPath,
      Value<String?>? homePage,
      Value<String>? originalLanguage,
      Value<String>? originalTitle,
      Value<String>? title,
      Value<String>? overview,
      Value<String>? releaseDate,
      Value<int>? runTime,
      Value<String>? status}) {
    return MoviesCompanion(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      isAdult: isAdult ?? this.isAdult,
      backdropPath: backdropPath ?? this.backdropPath,
      posterPath: posterPath ?? this.posterPath,
      homePage: homePage ?? this.homePage,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      runTime: runTime ?? this.runTime,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (isAdult.present) {
      map['is_adult'] = Variable<bool>(isAdult.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (homePage.present) {
      map['home_page'] = Variable<String>(homePage.value);
    }
    if (originalLanguage.present) {
      map['original_language'] = Variable<String>(originalLanguage.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (runTime.present) {
      map['run_time'] = Variable<int>(runTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('isAdult: $isAdult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('posterPath: $posterPath, ')
          ..write('homePage: $homePage, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('runTime: $runTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $GenresTable extends Genres with TableInfo<$GenresTable, Genre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _movieIdMeta =
      const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int> movieId = GeneratedColumn<int>(
      'movie_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES movies (movie_id)'));
  static const VerificationMeta _genreIdMeta =
      const VerificationMeta('genreId');
  @override
  late final GeneratedColumn<int> genreId = GeneratedColumn<int>(
      'genre_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, movieId, genreId, name];
  @override
  String get aliasedName => _alias ?? 'genres';
  @override
  String get actualTableName => 'genres';
  @override
  VerificationContext validateIntegrity(Insertable<Genre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(_genreIdMeta,
          genreId.isAcceptableOrUnknown(data['genre_id']!, _genreIdMeta));
    } else if (isInserting) {
      context.missing(_genreIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Genre map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Genre(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      movieId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movie_id'])!,
      genreId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}genre_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $GenresTable createAlias(String alias) {
    return $GenresTable(attachedDatabase, alias);
  }
}

class Genre extends DataClass implements Insertable<Genre> {
  final int id;
  final int movieId;
  final int genreId;
  final String name;
  const Genre(
      {required this.id,
      required this.movieId,
      required this.genreId,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['movie_id'] = Variable<int>(movieId);
    map['genre_id'] = Variable<int>(genreId);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenresCompanion toCompanion(bool nullToAbsent) {
    return GenresCompanion(
      id: Value(id),
      movieId: Value(movieId),
      genreId: Value(genreId),
      name: Value(name),
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Genre(
      id: serializer.fromJson<int>(json['id']),
      movieId: serializer.fromJson<int>(json['movieId']),
      genreId: serializer.fromJson<int>(json['genreId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'movieId': serializer.toJson<int>(movieId),
      'genreId': serializer.toJson<int>(genreId),
      'name': serializer.toJson<String>(name),
    };
  }

  Genre copyWith({int? id, int? movieId, int? genreId, String? name}) => Genre(
        id: id ?? this.id,
        movieId: movieId ?? this.movieId,
        genreId: genreId ?? this.genreId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Genre(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('genreId: $genreId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, movieId, genreId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Genre &&
          other.id == this.id &&
          other.movieId == this.movieId &&
          other.genreId == this.genreId &&
          other.name == this.name);
}

class GenresCompanion extends UpdateCompanion<Genre> {
  final Value<int> id;
  final Value<int> movieId;
  final Value<int> genreId;
  final Value<String> name;
  const GenresCompanion({
    this.id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.genreId = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenresCompanion.insert({
    this.id = const Value.absent(),
    required int movieId,
    required int genreId,
    required String name,
  })  : movieId = Value(movieId),
        genreId = Value(genreId),
        name = Value(name);
  static Insertable<Genre> custom({
    Expression<int>? id,
    Expression<int>? movieId,
    Expression<int>? genreId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movieId != null) 'movie_id': movieId,
      if (genreId != null) 'genre_id': genreId,
      if (name != null) 'name': name,
    });
  }

  GenresCompanion copyWith(
      {Value<int>? id,
      Value<int>? movieId,
      Value<int>? genreId,
      Value<String>? name}) {
    return GenresCompanion(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      genreId: genreId ?? this.genreId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (genreId.present) {
      map['genre_id'] = Variable<int>(genreId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresCompanion(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('genreId: $genreId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $VideosTable extends Videos with TableInfo<$VideosTable, Video> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VideosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _movieIdMeta =
      const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int> movieId = GeneratedColumn<int>(
      'movie_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES movies (movie_id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _siteMeta = const VerificationMeta('site');
  @override
  late final GeneratedColumn<String> site = GeneratedColumn<String>(
      'site', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
      'size', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _officialMeta =
      const VerificationMeta('official');
  @override
  late final GeneratedColumn<bool> official =
      GeneratedColumn<bool>('official', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("official" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  static const VerificationMeta _videoIdMeta =
      const VerificationMeta('videoId');
  @override
  late final GeneratedColumn<String> videoId = GeneratedColumn<String>(
      'video_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, movieId, name, key, site, size, type, official, videoId];
  @override
  String get aliasedName => _alias ?? 'videos';
  @override
  String get actualTableName => 'videos';
  @override
  VerificationContext validateIntegrity(Insertable<Video> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('site')) {
      context.handle(
          _siteMeta, site.isAcceptableOrUnknown(data['site']!, _siteMeta));
    } else if (isInserting) {
      context.missing(_siteMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('official')) {
      context.handle(_officialMeta,
          official.isAcceptableOrUnknown(data['official']!, _officialMeta));
    }
    if (data.containsKey('video_id')) {
      context.handle(_videoIdMeta,
          videoId.isAcceptableOrUnknown(data['video_id']!, _videoIdMeta));
    } else if (isInserting) {
      context.missing(_videoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Video map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Video(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      movieId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movie_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      site: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site'])!,
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      official: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}official'])!,
      videoId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_id'])!,
    );
  }

  @override
  $VideosTable createAlias(String alias) {
    return $VideosTable(attachedDatabase, alias);
  }
}

class Video extends DataClass implements Insertable<Video> {
  final int id;
  final int movieId;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String videoId;
  const Video(
      {required this.id,
      required this.movieId,
      required this.name,
      required this.key,
      required this.site,
      required this.size,
      required this.type,
      required this.official,
      required this.videoId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['movie_id'] = Variable<int>(movieId);
    map['name'] = Variable<String>(name);
    map['key'] = Variable<String>(key);
    map['site'] = Variable<String>(site);
    map['size'] = Variable<int>(size);
    map['type'] = Variable<String>(type);
    map['official'] = Variable<bool>(official);
    map['video_id'] = Variable<String>(videoId);
    return map;
  }

  VideosCompanion toCompanion(bool nullToAbsent) {
    return VideosCompanion(
      id: Value(id),
      movieId: Value(movieId),
      name: Value(name),
      key: Value(key),
      site: Value(site),
      size: Value(size),
      type: Value(type),
      official: Value(official),
      videoId: Value(videoId),
    );
  }

  factory Video.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Video(
      id: serializer.fromJson<int>(json['id']),
      movieId: serializer.fromJson<int>(json['movieId']),
      name: serializer.fromJson<String>(json['name']),
      key: serializer.fromJson<String>(json['key']),
      site: serializer.fromJson<String>(json['site']),
      size: serializer.fromJson<int>(json['size']),
      type: serializer.fromJson<String>(json['type']),
      official: serializer.fromJson<bool>(json['official']),
      videoId: serializer.fromJson<String>(json['videoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'movieId': serializer.toJson<int>(movieId),
      'name': serializer.toJson<String>(name),
      'key': serializer.toJson<String>(key),
      'site': serializer.toJson<String>(site),
      'size': serializer.toJson<int>(size),
      'type': serializer.toJson<String>(type),
      'official': serializer.toJson<bool>(official),
      'videoId': serializer.toJson<String>(videoId),
    };
  }

  Video copyWith(
          {int? id,
          int? movieId,
          String? name,
          String? key,
          String? site,
          int? size,
          String? type,
          bool? official,
          String? videoId}) =>
      Video(
        id: id ?? this.id,
        movieId: movieId ?? this.movieId,
        name: name ?? this.name,
        key: key ?? this.key,
        site: site ?? this.site,
        size: size ?? this.size,
        type: type ?? this.type,
        official: official ?? this.official,
        videoId: videoId ?? this.videoId,
      );
  @override
  String toString() {
    return (StringBuffer('Video(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('name: $name, ')
          ..write('key: $key, ')
          ..write('site: $site, ')
          ..write('size: $size, ')
          ..write('type: $type, ')
          ..write('official: $official, ')
          ..write('videoId: $videoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, movieId, name, key, site, size, type, official, videoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Video &&
          other.id == this.id &&
          other.movieId == this.movieId &&
          other.name == this.name &&
          other.key == this.key &&
          other.site == this.site &&
          other.size == this.size &&
          other.type == this.type &&
          other.official == this.official &&
          other.videoId == this.videoId);
}

class VideosCompanion extends UpdateCompanion<Video> {
  final Value<int> id;
  final Value<int> movieId;
  final Value<String> name;
  final Value<String> key;
  final Value<String> site;
  final Value<int> size;
  final Value<String> type;
  final Value<bool> official;
  final Value<String> videoId;
  const VideosCompanion({
    this.id = const Value.absent(),
    this.movieId = const Value.absent(),
    this.name = const Value.absent(),
    this.key = const Value.absent(),
    this.site = const Value.absent(),
    this.size = const Value.absent(),
    this.type = const Value.absent(),
    this.official = const Value.absent(),
    this.videoId = const Value.absent(),
  });
  VideosCompanion.insert({
    this.id = const Value.absent(),
    required int movieId,
    required String name,
    required String key,
    required String site,
    required int size,
    required String type,
    this.official = const Value.absent(),
    required String videoId,
  })  : movieId = Value(movieId),
        name = Value(name),
        key = Value(key),
        site = Value(site),
        size = Value(size),
        type = Value(type),
        videoId = Value(videoId);
  static Insertable<Video> custom({
    Expression<int>? id,
    Expression<int>? movieId,
    Expression<String>? name,
    Expression<String>? key,
    Expression<String>? site,
    Expression<int>? size,
    Expression<String>? type,
    Expression<bool>? official,
    Expression<String>? videoId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movieId != null) 'movie_id': movieId,
      if (name != null) 'name': name,
      if (key != null) 'key': key,
      if (site != null) 'site': site,
      if (size != null) 'size': size,
      if (type != null) 'type': type,
      if (official != null) 'official': official,
      if (videoId != null) 'video_id': videoId,
    });
  }

  VideosCompanion copyWith(
      {Value<int>? id,
      Value<int>? movieId,
      Value<String>? name,
      Value<String>? key,
      Value<String>? site,
      Value<int>? size,
      Value<String>? type,
      Value<bool>? official,
      Value<String>? videoId}) {
    return VideosCompanion(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      videoId: videoId ?? this.videoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (site.present) {
      map['site'] = Variable<String>(site.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (official.present) {
      map['official'] = Variable<bool>(official.value);
    }
    if (videoId.present) {
      map['video_id'] = Variable<String>(videoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VideosCompanion(')
          ..write('id: $id, ')
          ..write('movieId: $movieId, ')
          ..write('name: $name, ')
          ..write('key: $key, ')
          ..write('site: $site, ')
          ..write('size: $size, ')
          ..write('type: $type, ')
          ..write('official: $official, ')
          ..write('videoId: $videoId')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final $GenresTable genres = $GenresTable(this);
  late final $VideosTable videos = $VideosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies, genres, videos];
}
