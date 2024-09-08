import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:quran/views/every_types_screen/models/all_media_model.dart';

class AllMediaServices {
  final Dio dio = Dio();
  AllMediaModel allMediaModel = AllMediaModel();
  Future<Map<String, dynamic>?> getAllMedia({required String media}) async {
    try {
      final response = await dio.get(
        'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/get-category-items/5366/$media/ar/ar/1/25/json',
      );
      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
      return null;
    }
  }
}
