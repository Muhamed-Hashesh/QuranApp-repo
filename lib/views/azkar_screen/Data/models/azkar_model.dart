class AzkarModel {
  late int iD;
  late String aRABICTEXT;
  late int rEPEAT;

  AzkarModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    aRABICTEXT = json['ARABIC_TEXT'];
    rEPEAT = json['REPEAT'];
  }
}
