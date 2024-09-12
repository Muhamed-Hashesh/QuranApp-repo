import 'dart:developer';

import 'package:dio/dio.dart';

class HadithApi {
  late Dio dio;
  HadithApi() {
    dio = Dio();
  }

  Future<List<dynamic>> getAhadith({required String type}) async {
    try {
      final response = await dio
          .get('https://hadis-api-id.vercel.app/hadith/$type?page=1&limit=10');
      if (response.data != null && response.data['items'] != null) {
        return response.data['items'];
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
