import 'package:flutter/material.dart';

import '../themes/colors.dart';

class TimeNextpray extends StatelessWidget {
  const TimeNextpray({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الظهر',
                  style: TextStyle(
                    fontSize: 16,
                    color: LightColors.instance.kPrimaryColor,
                  ),
                ),
                Text(
                  '11:45',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: LightColors.instance.kPrimaryColor,
                  ),
                ),
                Text(
                  'الصلاة التالية: العصر',
                  style: TextStyle(
                    fontSize: 14,
                    color: LightColors.instance.kPrimaryColor,
                  ),
                ),
                Text(
                  '2:50 مساءً',
                  style: TextStyle(
                    fontSize: 14,
                    color: LightColors.instance.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
