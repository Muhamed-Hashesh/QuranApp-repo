import 'package:quran/views/azkar_screen/Data/azkar_api/azkar_api.dart';
import 'package:quran/views/azkar_screen/Data/models/azkar_model.dart';

class AzkarRepo {
  final AzkarApi azkarApi;
  AzkarRepo({required this.azkarApi});

  Future<List<AzkarModel>> getAzkar() async {
    final response = await azkarApi.getAzkar();
    return response.map((e) => AzkarModel.fromJson(e)).toList();
  }
}
