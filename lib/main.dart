import 'package:exemplo_cubit/dashboard/dashboard_page.dart';
import 'package:exemplo_cubit/exemplo_builder/cubit/my_builder_cubit.dart';
import 'package:exemplo_cubit/exemplo_builder/my_builder_page.dart';
import 'package:exemplo_cubit/exemplo_consumer/cubit/my_consumer_cubit.dart';
import 'package:exemplo_cubit/exemplo_consumer/my_consumer_page.dart';
import 'package:exemplo_cubit/exemplo_listenner/cubit/my_listenner_cubit.dart';
import 'package:exemplo_cubit/exemplo_listenner/my_listenner_page.dart';
import 'package:exemplo_cubit/login_complexo/cubit/login_complexo_cubit.dart';
import 'package:exemplo_cubit/login_complexo/login_complexo_page.dart';
import 'package:exemplo_cubit/login_simples/cubit/login_simples_cubit.dart';
import 'package:exemplo_cubit/login_simples/login_simples_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPage(),
        '/exemplo_builder': (context) => MyBuilderPage(
              cubit: MyBuilderCubit(),
            ),
        '/exemplo_listenner': (context) => MyListennerPage(
              cubit: MyListennerCubit(),
            ),
        '/exemplo_consumer': (context) => MyConsumerPage(
              cubit: MyConsumerCubit(),
            ),
        '/login_complexo': (context) => LoginComplexoPage(
              cubit: LoginComplexoCubit(),
            ),
        '/login_simples': (context) => LoginSimplesPage(
              cubit: LoginSimplesCubit(),
            ),
      },
    );
  }
}

class MyTheme {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.oswald(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      );
}
