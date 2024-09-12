class HadithModel {
  final int number;
  final String arab;
  final String en;

  HadithModel({required this.number, required this.arab, required this.en});

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      number: json["number"],
      arab: json["arab"],
      en: json["id"],
    );
  }
}
