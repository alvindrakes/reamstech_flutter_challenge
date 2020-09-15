import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

bool _darkMode = false;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Section',
            tiles: [
              SettingsTile.switchTile(
                title: 'Dark Theme',
                leading: Icon(CupertinoIcons.heart),
                switchValue: _darkMode,
                onToggle: (bool value) {
                  if (value) {
                    _darkMode = true;

                    Get.changeTheme(ThemeData.dark());
                  } else {
                    _darkMode = false;

                    Get.changeTheme(ThemeData.light());
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
