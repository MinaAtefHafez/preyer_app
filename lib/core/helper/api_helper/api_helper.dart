import 'package:dio/dio.dart';

abstract class ApiHelper {
  Future<Map<String, dynamic>> get(
      {required String url, Map<String, dynamic>? queryParam});
  Future<Map<String, dynamic>> post({required String url});
}

class DioHelper extends ApiHelper {
  final Dio _dio;

  DioHelper(this._dio) {
    _dio.options
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);
  }

  @override
  Future<Map<String, dynamic>> get(
      {required String url, Map<String, dynamic>? queryParam}) async {
    final response = await _dio.get('${ApiEndPoints.baseUrl}/$url',
        queryParameters: queryParam);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post({required String url}) async {
    final response = await _dio.post('${ApiEndPoints.baseUrl}/$url');
    return response.data;
  }
}

abstract class ApiEndPoints {
  static const baseUrl = 'http://api.aladhan.com/v1';
  static const methods = 'methods';
  static const calendar = 'calendar';
}
