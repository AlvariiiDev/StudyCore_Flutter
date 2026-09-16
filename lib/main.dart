import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const StudyCoreApp());
}

class StudyCoreApp extends StatefulWidget {
  const StudyCoreApp({super.key});

  @override
  State<StudyCoreApp> createState() => _StudyCoreAppState();
}

class _StudyCoreAppState extends State<StudyCoreApp> {
  ThemeMode themeMode = ThemeMode.dark;

  void alternarTema() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudyCore',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: LoginPage(onThemeChanged: alternarTema),
    );
  }
}
