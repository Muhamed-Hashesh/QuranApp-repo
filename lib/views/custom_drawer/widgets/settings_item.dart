import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsItem extends StatefulWidget {
  const SettingsItem(
      {super.key, required this.index, required this.settingsList});

  final int index;
  final List settingsList;

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool isNightModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          widget.settingsList[widget.index]['label'],
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
        trailing: widget.settingsList[widget.index]['hasSwitch']
            ? Switch(
                value: isNightModeEnabled,
                onChanged: (value) {
                  setState(() {
                    isNightModeEnabled = value;
                  });
                },
                activeColor: Theme.of(context).colorScheme.primary,
              )
            : null,
        leading: widget.settingsList[widget.index]['icon']);
  }
}
