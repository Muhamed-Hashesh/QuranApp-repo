import 'package:flutter/material.dart';
import 'package:quran/helpers/texts_helpers.dart';

class ReachTextReqaa extends StatelessWidget {
  const ReachTextReqaa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        reqaaFont16Regular(context, colorProperty: 'black', text: '٠'),
        reqaaFont16Regular(context,
            colorProperty: 'grey', text: ' مرات من أصل '),
        reqaaFont16Regular(context, colorProperty: 'black', text: '٣'),
      ],
    );
  }
}
