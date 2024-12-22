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
      theme: ThemeData(
        appBarTheme: appBarTheme(),
        scaffoldBackgroundColor: SolidColors.backgroundColor,
        outlinedButtonTheme: borderTheme(),
        iconTheme: iconTheme(),
        textTheme: textTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
        bodyMedium: TextStyle(
          color: SolidColors.white,
          fontSize: 20,
        ),
        bodyLarge: TextStyle(
          color: SolidColors.white,
          fontSize: 20,
        ),
        bodySmall: TextStyle(
          color: SolidColors.white,
          fontSize: 15,
        ),
        labelMedium: TextStyle(
          color: SolidColors.greenColor,
          fontSize: 20,
        ));
  }

  IconThemeData iconTheme() {
    return IconThemeData(
      size: 25,
      color: SolidColors.greyColor,
    );
  }

  OutlinedButtonThemeData borderTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: Size(150, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: SolidColors.backgroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: SolidColors.white,
        fontSize: 20,
      ),
    );
  }
}
