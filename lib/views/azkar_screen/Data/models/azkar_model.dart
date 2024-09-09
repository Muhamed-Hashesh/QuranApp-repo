class AzkarModel {
  final int id;
  final String aRABICTEXT;
  final int repeat;

  AzkarModel({
    required this.id,
    required this.aRABICTEXT,
    required this.repeat,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      id: json['ID'] ?? 0,
      aRABICTEXT: json['ARABIC_TEXT'] ?? '',
      repeat: json['REPEAT'] ?? 1,
    );
  }
}
