import 'package:dio/dio.dart';

String baseUrl = 'https://cashbuddy.foverotechnologies.com/api';

class DioInstance {
  late Dio _dio;

  DioInstance() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _setupInterceptors();
  }

  Dio get dio => _dio;

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Sending request to ${options.uri}');

        handler.next(options);
      },
      onResponse: (response, handler) {
        print('Received response');
        handler.next(response);
      },
      onError: (DioError e, handler) {
        // print('Error occurred: $e');
        print(e.response!.data);
        handler.next(e);
      },
    ));
  }
}
