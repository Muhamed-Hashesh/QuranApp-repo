import 'package:quran_project/views/azkar_screen/Data/azkar_api/azkar_api.dart';
import 'package:quran_project/views/azkar_screen/Data/models/azkar_model.dart';

class AzkarRepo {
  final AzkarApi azkarApi;

  AzkarRepo({required this.azkarApi});

  Future<List<AzkarModel>> getAzkar(int id, String type) async {
    final response = await azkarApi.getAzkar(id: id, type: type);
    return response.map((e) => AzkarModel.fromJson(e)).toList();
  }
}
