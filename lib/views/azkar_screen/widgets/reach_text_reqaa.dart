import 'package:flutter/material.dart';
import 'package:quran/helpers/texts_helpers.dart';
import 'package:quran/views/azkar_screen/Data/models/azkar_model.dart';

class ReachTextReqaa extends StatelessWidget {
  final AzkarModel azkarModel;
  const ReachTextReqaa({
    super.key,
    required this.azkarModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        reqaaFont16Regular(context, colorProperty: 'black', text: '٠'),
        reqaaFont16Regular(context,
            colorProperty: 'grey', text: ' مرات من أصل '),
        reqaaFont16Regular(context,
            colorProperty: 'black', text: '${azkarModel.repeat}'),
      ],
    );
  }
}
