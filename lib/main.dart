import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practise_app/screens/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme1 = ThemeData(
  scaffoldBackgroundColor: Colors.blue,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 3, 255, 87),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme1,
      home: const Scaffold(
        body: TodoeyScreen(),
      ),
    );
  }
}
