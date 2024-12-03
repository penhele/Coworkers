import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/config/appwrite.dart';
import 'package:coworkers/config/enums.dart';
import 'package:coworkers/pages/get_started.dart';
import 'package:coworkers/pages/sign_in_page.dart';
import 'package:coworkers/pages/sign_up_page.dart';
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
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: AppColor.text, 
          displayColor: AppColor.text
        ),
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(primary: AppColor.primary),
        filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size.fromHeight(52)),
            textStyle: WidgetStatePropertyAll(TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ))
          )
        )
      ),

      initialRoute: AppRoute.getStarted.name,

      routes: {
        AppRoute.getStarted.name: (context) => const GetStartedPage(),
        AppRoute.signUp.name: (context) => const SignUpPage(),
        AppRoute.signIn.name: (context) => const SignInPage(),
      }
    );
  }
}