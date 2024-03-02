import 'package:dio/dio.dart';

abstract class ApiHelper {
  Future<Map<String, dynamic>> get({required String url , Map<String , dynamic>? queryParam });
  Future<Map<String, dynamic>> post({required String url});
}

class DioHelper extends ApiHelper {
  final Dio _dio;

  final String _baseUrl = 'http://api.aladhan.com/v1';

  DioHelper(this._dio);

  @override
  Future<Map<String, dynamic>> get(
      {required String url, Map<String, dynamic>? queryParam}) async {
    final response = await _dio.get('$_baseUrl/$url', queryParameters: queryParam);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post({required String url}) async {
    final response = await _dio.post('$_baseUrl/$url');
    return response.data;
  }
}

abstract class ApiEndPoints {
  static const methods = 'methods';
  static const calendar = 'calendar';
}
