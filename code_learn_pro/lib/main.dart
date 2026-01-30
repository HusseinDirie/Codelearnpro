import 'package:code_learn_pro/screens/home_screen.dart';
import 'package:code_learn_pro/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => const CodeLearnProApp()),
  );
}

class CodeLearnProApp extends StatelessWidget {
  const CodeLearnProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeLearn Pro',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
