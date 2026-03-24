import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL_GO_API'] ?? '',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
      ),
    );

    // Interceptor để tự động nhét Token vào mọi request gửi lên Golang
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Lấy token từ local storage (ví dụ SharedPreferences)
          // String token = await getToken();
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // Xử lý lỗi tập trung (VD: 401 thì văng ra màn hình Login)
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
