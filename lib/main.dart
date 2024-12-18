import 'package:crypto/components/constants/solid_colors.dart';
import 'package:crypto/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: applicationTheme(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

  ThemeData applicationTheme() => ThemeData(
        scaffoldBackgroundColor: SolidColors.backgroundColor,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            fixedSize: Size(150, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
        iconTheme: IconThemeData(
          size: 35,
          color: SolidColors.greyColor,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: SolidColors.white,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
            color: SolidColors.white,
            fontSize: 20,
          ),
        ),
      );
}
