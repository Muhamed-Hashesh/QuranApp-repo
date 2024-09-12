import 'package:flutter/material.dart';
import 'package:quran_project/helpers/texts_helpers.dart';
import 'package:quran_project/helpers/to_arabic.dart';
import 'package:quran_project/views/azkar_screen/Data/models/azkar_model.dart';

class ReachTextReqaa extends StatelessWidget {
  final AzkarModel? azkarModel;
  final int repeatCount;
  final bool isNum;
  final int num;

  const ReachTextReqaa({
    super.key,
    this.azkarModel,
    this.isNum = false,
    this.num = 0,
    required this.repeatCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        reqaaFont16Regular(context,
            colorProperty: 'black',
            text: convertToArabicNumerals(repeatCount.toString())),
        reqaaFont16Regular(context,
            colorProperty: 'grey', text: ' مرات من أصل '),
        reqaaFont16Regular(context,
            colorProperty: 'black',
            text: isNum
                ? convertToArabicNumerals(num.toString())
                : convertToArabicNumerals(azkarModel!.repeat.toString())),
      ],
    );
  }
}
