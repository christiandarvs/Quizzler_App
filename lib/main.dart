import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzler_app/pages/quiz_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffF0F0F0),
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            centerTitle: true,
            backgroundColor: Color(0xffD5B4B4)),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const QuizPage(),
    );
  }
}
