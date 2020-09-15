import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'root_page.dart';
import 'constants/theme_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reams Tech challenge',
      theme: ThemeData(
        scaffoldBackgroundColor: ThemeColors.scaffoldBackground,
      ),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: RootPage(),
    );
  }
}
