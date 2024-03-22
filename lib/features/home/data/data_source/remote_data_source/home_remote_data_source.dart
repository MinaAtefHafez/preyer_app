import 'package:dio/dio.dart';
import 'package:prayer_app/core/exceptions/exceptions.dart';
import 'package:prayer_app/core/helper/api_helper/api_helper.dart';

abstract class HomeRemoteDataSource {
  Future<Map<String, dynamic>> getCalender(
      {required Map<String, dynamic> queryParam, String? year, String? month});
  Future<Map<String, dynamic>> getCalenderYear(
      {required Map<String, dynamic> queryParam, String year});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiHelper _apiHelper;

  HomeRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<Map<String, dynamic>> getCalender(
      {required Map<String, dynamic> queryParam,
      String? year,
      String? month}) async {
    try {
      final endPoint = '${ApiEndPoints.calendar}/$year/$month';

      final data = await _apiHelper.get(url: endPoint, queryParam: queryParam);
      return data;
    } on DioException catch (e) {
      throw ServerException.fromDioException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getCalenderYear(
      {required Map<String, dynamic> queryParam, String? year}) async {
    try {
      year = year ?? DateTime.now().year.toString();
      final endPoint = '${ApiEndPoints.calendar}/$year';

      final data = await _apiHelper.get(url: endPoint, queryParam: queryParam);
      return data;
    } on DioException catch (e) {
      throw ServerException.fromDioException(e);
    }
  }
}
