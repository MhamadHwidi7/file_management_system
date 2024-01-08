// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:file_management_project/core/api/api_consumer.dart';
import 'package:file_management_project/core/api/end_points.dart';
import 'package:file_management_project/core/api/logging_interceptor.dart';
import 'package:file_management_project/core/resources/strings_constants.dart';
import 'package:file_management_project/core/utils/shared_preferences_utils.dart';
import 'package:file_management_project/injection.dart';

@singleton
class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}

@Singleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  DioConsumer(
    this._client,
  ) {
    _client.options
      ..sendTimeout = const Duration(seconds: 10)
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 60)
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = true;
    if (kDebugMode) {
      _client.interceptors
          .addAll([getIt<LoggingInterceptor>(), getIt<ErrorInterceptor>()]);
    }
  }
  final Dio _client;
  late Map<String, String> _headers;

  void setHeaders() async {
    _headers = {
      StringsConstants.accept: StringsConstants.applicationJson,
      StringsConstants.contentType: StringsConstants.applicationJson,
      StringsConstants.authorization: StringsConstants.bearer +
          SharedPreferencesUtils().getToken().toString()
    };
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    setHeaders();

    try {
      final Response response = await _client.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(
          headers: _headers,
          validateStatus: (int? status) {
            return status != null;
          },
        ),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      print("ssssssssssssssssssssssssssssssssssssssssss$error");
      rethrow;
    }
  }

  @override
  Future post(
    String path, {
    dynamic body,
    String? token,
    FormData? formData,
    ResponseType? responseType,
    Map<String, dynamic>? queryParameters,
  }) async {
    setHeaders();

    try {
      final Response response = await _client.post(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: _headers,
          validateStatus: (int? status) {
            return status != null;
          },
          contentType:
              formData == null ? StringsConstants.jsonContentType : null,
          responseType: responseType,
        ),
        data: formData ?? body,
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    setHeaders();
    try {
      final Response response = await _client.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: _headers,
          contentType: StringsConstants.jsonContentType,
        ),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }

  dynamic _handleResponseAsJson(Response response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    setHeaders();

    try {
      final Response response = await _client.delete(
        path,
        data: body,
        options: Options(
          headers: _headers,
          contentType: StringsConstants.jsonContentType,
        ),
      );
      return _handleResponseAsJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
