import 'package:dio/dio.dart';
import 'package:prayer_app/core/exceptions/exceptions.dart';
import 'package:prayer_app/core/helper/api_helper/api_helper.dart';

abstract class HomeRemoteDataSource {
  Future<Map<String, dynamic>> getCalender(
      {required Map<String, dynamic> queryParam, String? year, String? month});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiHelper _apiHelper;

  HomeRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<Map<String, dynamic>> getCalender(
      {required Map<String, dynamic> queryParam, String? year, String? month}) {
    try {
      final endPoint = month != null
          ? '${ApiEndPoints.calendar}/${year ?? ''}/$month'
          : '${ApiEndPoints.calendar}/${year ?? ''}';
      final data = _apiHelper.get(url: endPoint, queryParam: queryParam);
      return data;
    } on DioException catch (e) {
      throw ServerException(e.message!);
    }
  }
}




