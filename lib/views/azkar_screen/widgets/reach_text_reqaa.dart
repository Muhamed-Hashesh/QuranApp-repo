import 'package:flutter/material.dart';
import 'package:quran_project/helpers/texts_helpers.dart';


class ReachTextReqaa extends StatelessWidget {
  final AzkarModel azkarModel;
  final int repeatCount;

  const ReachTextReqaa({
    super.key,
    required this.azkarModel,
    required this.repeatCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        reqaaFont16Regular(context,
            colorProperty: 'black', text: '$repeatCount'),
        reqaaFont16Regular(context,
            colorProperty: 'grey', text: ' مرات من أصل '),
        reqaaFont16Regular(context,
            colorProperty: 'black', text: '${azkarModel.repeat}'),
      ],
    );
  }
}
