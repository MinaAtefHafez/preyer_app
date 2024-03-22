import 'package:dio/dio.dart';
import 'package:prayer_app/core/exceptions/exceptions.dart';
import 'package:prayer_app/core/helper/api_helper/api_helper.dart';

abstract class DetailsAppRemoteDataSource {
  Future<Map<String, dynamic>> getMethods();
}

class DetailsAppRemoteDataSourceImpl implements DetailsAppRemoteDataSource {
  final ApiHelper _apiHelper;

  DetailsAppRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<Map<String, dynamic>> getMethods() async {
    try {
      final data = await _apiHelper.get(url: ApiEndPoints.methods);
      return data;
    } on DioException catch (e) {
      throw ServerException(e.message!);
    }
  }
}
