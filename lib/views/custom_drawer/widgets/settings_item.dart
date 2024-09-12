import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_project/themes/change_theme.dart';
import 'package:quran_project/themes/colors.dart';

class SettingsItem extends StatelessWidget {
  SettingsItem({super.key, required this.index, required this.settingsList});

  final int index;
  final List settingsList;

  final ChangeAppTheme changeAppThemeController = Get.put(ChangeAppTheme());

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          settingsList[index]['label'],
          maxLines: 1,
          softWrap: false,
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
        ),
        trailing: settingsList[index]['hasSwitch']
            ? Obx(() => Switch(
                  value: changeAppThemeController.isDarkMode.value,
                  onChanged: (value) {
                    changeAppThemeController.changeTheme(value);
                  },
                  activeColor: LightColors.instance.kPrimaryColor,
                ))
            : null,
        leading: settingsList[index]['icon']);
  }
}
