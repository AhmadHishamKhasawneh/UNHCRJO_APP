import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/vacancies_controller.dart';
import 'views/onboarding_screen.dart';

void main() {
  runApp(const UnhrcApp());
}

class UnhrcApp extends StatelessWidget {
  const UnhrcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VacanciesController()..loadVacancies(),
      child: MaterialApp(
        title: 'UNHCR Job Vacancies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF0075BD),
          hintColor: Colors.blueAccent,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontFamily: 'Lato',
                fontSize: 96.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5),
            displayMedium: TextStyle(
                fontFamily: 'Lato',
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5),
            displaySmall: TextStyle(
                fontFamily: 'Lato',
                fontSize: 48.0,
                fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(
                fontFamily: 'Lato',
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.25),
            headlineSmall: TextStyle(
                fontFamily: 'Lato',
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontFamily: 'Lato', fontSize: 16.0),
            bodyMedium: TextStyle(fontFamily: 'Lato', fontSize: 14.0),
            bodySmall: TextStyle(fontFamily: 'Lato', fontSize: 12.0),
            labelLarge: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontFamily: 'Lato', fontSize: 16.0),
            titleSmall: TextStyle(fontFamily: 'Lato', fontSize: 14.0),
          ),
          cardTheme: CardTheme(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF0075BD),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF0075BD),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF0075BD),
              side: const BorderSide(color: Color(0xFF0075BD)),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey,
          hintColor: Colors.tealAccent,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontFamily: 'Lato',
                fontSize: 96.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5),
            displayMedium: TextStyle(
                fontFamily: 'Lato',
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5),
            displaySmall: TextStyle(
                fontFamily: 'Lato',
                fontSize: 48.0,
                fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(
                fontFamily: 'Lato',
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.25),
            headlineSmall: TextStyle(
                fontFamily: 'Lato',
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontFamily: 'Lato', fontSize: 16.0),
            bodyMedium: TextStyle(fontFamily: 'Lato', fontSize: 14.0),
            bodySmall: TextStyle(fontFamily: 'Lato', fontSize: 12.0),
            labelLarge: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontFamily: 'Lato', fontSize: 16.0),
            titleSmall: TextStyle(fontFamily: 'Lato', fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
