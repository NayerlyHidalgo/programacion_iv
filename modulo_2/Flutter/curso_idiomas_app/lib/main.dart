import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curso_idiomas_app/providers/language_provider.dart';
import 'package:curso_idiomas_app/providers/user_provider.dart';
import 'package:curso_idiomas_app/screens/home_screen.dart';
import 'package:curso_idiomas_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Curso de Idiomas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF2196F3),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF2196F3),
            secondary: Color(0xFF4CAF50),
          ),
          fontFamily: 'Roboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cardTheme: CardThemeData(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF2196F3),
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Color(0xFF2196F3),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        home: SplashScreen(),
        routes: {
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}