import 'dart:developer';

import 'package:dio/dio.dart';

class AzkarApi {
  late Dio dio;
  AzkarApi() {
    dio = Dio();
  }

  Future<List<dynamic>> getAzkar(
      {required int id, required String type}) async {
    try {
      final response =
          await dio.get('https://www.hisnmuslim.com/api/ar/$id.json');

      // Check if the response has the expected key
      if (response.data != null && response.data[type] != null) {
        return response.data[type];
      } else {
        log('The expected key is missing in the response.');
        return [];
      }
    } on DioException catch (e) {
      log('DioException: ${e.toString()}');
      return [];
    } catch (e) {
      log('An unexpected error occurred: ${e.toString()}');
      return [];
    }
  }
}
