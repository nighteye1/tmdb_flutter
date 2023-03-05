import 'package:dio/dio.dart';
import 'package:tmdb_app/networking/api_response.dart';
import 'package:tmdb_app/networking/networking.dart';
import 'package:tmdb_app/utils/api_constants.dart';

class MovieRepository {
  Future<ApiResponse> getUpcomingMovies() async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '${ApiConstants.baseUrl}${ApiConstants.upcomingMovie}');

    Response response = await networkHelper.getData(
      queryParameters: {
        'api_key': ApiConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      return ApiResponse(
        status: Status.success,
        data: response.data,
      );
    } else {
      return ApiResponse(
        status: Status.error,
        message: response.data != null
            ? response.data['status_message'] ?? 'something went wrong'
            : 'something went wrong',
      );
    }
  }

  Future<ApiResponse> getMovieDetails({required int movieId}) async {
    NetworkHelper networkHelper = NetworkHelper(
      url: '${ApiConstants.baseUrl}$movieId',
    );

    Response response = await networkHelper.getData(
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'append_to_response': 'videos',
      },
    );

    if (response.statusCode == 200) {
      return ApiResponse(
        status: Status.success,
        data: response.data,
      );
    } else {
      return ApiResponse(
        status: Status.error,
        message: response.data['status_message'],
      );
    }
  }
}
