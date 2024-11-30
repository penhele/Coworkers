import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/config/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppWrite.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(
        useMaterial3: true
      ).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: AppColor.text, 
          displayColor: AppColor.text
        ),
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(primary: AppColor.primary)
      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}