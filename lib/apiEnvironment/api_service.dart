
import 'package:flutter/cupertino.dart';

import '../utils/aapString.dart';
import '../utils/sharePerf.dart';
import 'api_url.dart';

/*class ApiService {
  static final _options = BaseOptions(
    baseUrl: ApiUrl.stagingBaseUrl,
    connectTimeout: ApiUrl.connectionTimeout,
    receiveTimeout: ApiUrl.receiveTimeout,
    sendTimeout: ApiUrl.sendTimeout,
    responseType: ResponseType.json,
  );
  var token = SharedPref.getUserDataString(variableName: AppStrings.authToken);

  // dio instance
  final Dio _dio = Dio(_options)..interceptors.add(LogInterceptor());

  // GET request
  Future<Response?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": token == null ? token ?? '' : "Bearer ${token ?? ''}"
      };
      print("this is authentication token ${token}");
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      return null;
    }
  }

  // POST request
  Future<Response?> post(
    String? url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": token == null ? token ?? '' : "Bearer ${token ?? ''}"
      };
      print("this is authentication token ${token}");

      final Response response = await _dio.post(
        url ?? "",
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response);
      debugPrint("data iss $queryParameters");
      return response;
    } catch (e) {
      return null;
    }
  }

  // Multipart POST request
  Future<Response> postMultipart(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      FormData formData = FormData.fromMap(data ?? {});

      final Response response = await _dio.post(
        url,
        data: formData,
        queryParameters: queryParameters,
        options: options ??
            Options(
              headers: {
                'Content-Type': 'multipart/form-data',
              },
            ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT request
  Future<Response> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: Utils.getHeadersWithToken(),
          validateStatus: (status) => true,
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE request
  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}*/
