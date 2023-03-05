import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'check_internet_connection.dart';

class NetworkHelper {
  NetworkHelper({@required this.url});

  String? url;
  InternetConnection internetConnection = InternetConnection();

  Future<dynamic> postData(
      {bool wantQuery = true,
      FormData? formData,
      var rawData,
      Map<String, dynamic>? queryParameters}) async {
    if (await internetConnection.checkInternetConnection()) {
      try {
        Dio dio = await _initDio();
        Response response;
        response = await dio.post(url.toString(),
            data: formData ?? rawData,
            queryParameters: wantQuery ? queryParameters : null);

        return response;
      } on DioError catch (error, stacktrace) {
        if (kDebugMode) {
          print("Exception occured: $error stackTrace: $stacktrace");
        }
        return _checkTimeOutError(error);
      } on SocketException catch (e) {
        if (kDebugMode) {
          print(e);
        }

        Response<dynamic> response = Response<dynamic>(
            requestOptions: RequestOptions(path: ''), statusCode: 12029);
        return response;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Response<dynamic> response = Response<dynamic>(
            requestOptions: RequestOptions(path: ''), statusCode: 3);
        return response;
      } finally {
        internetConnection.checkInternetConnection();
      }
    } else {
      Response<dynamic> response = Response<dynamic>(
          requestOptions: RequestOptions(path: ''),
          statusCode: 12029); //its internet gone status code
      return response;
    }
  }

  dynamic _checkTimeOutError(DioError error) async {
    if (error.type == DioErrorType.connectionTimeout ||
        error.type == DioErrorType.receiveTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.unknown) {
      Response<dynamic> response = Response<dynamic>(
          requestOptions: RequestOptions(path: ''), statusCode: 11);
      return response;
    } else if (error.type == DioErrorType.badResponse) {
      if (error.response?.statusCode == 404) {
        dynamic errorMessage = jsonDecode(error.response?.data);
        if (errorMessage['message'] == "User Not Found!") {}
      }
      return error.response;
    } else {
      Response<dynamic> response = Response<dynamic>(
          requestOptions: RequestOptions(path: ''), statusCode: 500);
      return response;
    }
  }

  Future<Dio> _initDio() async {
    BaseOptions options = BaseOptions(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    Dio dio = Dio(options);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));

    return dio;
  }

  Future<dynamic> getData({Map<String, dynamic>? queryParameters}) async {
    if (await internetConnection.checkInternetConnection()) {
      try {
        Response response;
        Dio dio = await _initDio();
        response =
            await dio.get(url.toString(), queryParameters: queryParameters);
        return response;
      } on DioError catch (error, stacktrace) {
        if (kDebugMode) {
          print("Exception occured: $error stackTrace: $stacktrace");
        }
        return _checkTimeOutError(error);
      } on SocketException catch (_) {
        Response<dynamic> response = Response<dynamic>(
            requestOptions: RequestOptions(path: ''), statusCode: 12029);
        return response;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Response<dynamic> response = Response<dynamic>(
            requestOptions: RequestOptions(path: ''), statusCode: 3);
        return response;
      } finally {
        internetConnection.checkInternetConnection();
      }
    } else {
      Response<dynamic> response = Response<dynamic>(
          requestOptions: RequestOptions(path: ''), statusCode: 12029);
      return response;
    }
  }

  Future<dynamic> putData(
      {dynamic rawData,
      FormData? formData,
      Map<String, dynamic>? queryParams}) async {
    if (kDebugMode) {
      print(formData?.fields);
    }
    if (await internetConnection.checkInternetConnection()) {
      try {
        Response response;
        Dio dio = await _initDio();
        response = await dio.put(url.toString(),
            data: formData ?? rawData, queryParameters: queryParams);

        return response;
      } on DioError catch (error, stacktrace) {
        if (kDebugMode) {
          print(
              "-----------Exception occured-------------: $error stackTrace: $stacktrace");
        }
        return _checkTimeOutError(error);
      } on SocketException catch (_) {
        Response<dynamic> response = Response<dynamic>(
            requestOptions: RequestOptions(path: ''), statusCode: 12029);
        return response;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Response<dynamic> response = Response<dynamic>(
            requestOptions: RequestOptions(path: ''), statusCode: 3);
        return response;
      } finally {
        internetConnection.checkInternetConnection();
      }
    } else {
      Response<dynamic> response = Response<dynamic>(
          requestOptions: RequestOptions(path: ''), statusCode: 12029);
      return response;
    }
  }

  Future<dynamic> deleteData() async {
    if (await internetConnection.checkInternetConnection()) {
      try {
        Response response;
        Dio dio = await _initDio();
        response = await dio.delete(
          url.toString(),
        );
        return response;
      } on DioError catch (error, stacktrace) {
        if (kDebugMode) {
          print("Exception occured: $error stackTrace: $stacktrace");
        }
        return _checkTimeOutError(error);
      } on SocketException catch (_) {
        Response<dynamic> response = Response<dynamic>(
            requestOptions: RequestOptions(path: ''), statusCode: 12029);
        return response;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Response<dynamic> response = Response<dynamic>(
            requestOptions: RequestOptions(path: ''), statusCode: 3);
        return response;
      } finally {
        internetConnection.checkInternetConnection();
      }
    } else {
      Response<dynamic> response = Response<dynamic>(
          requestOptions: RequestOptions(path: ''), statusCode: 12029);
      return response;
    }
  }
}
