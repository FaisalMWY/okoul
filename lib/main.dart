import 'package:flutter/material.dart';
import 'package:quizu_app/screens/quiz_screen/after_quiz_screen.dart';
import 'package:quizu_app/screens/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:quizu_app/screens/home_screen/home_screen.dart';
import 'package:quizu_app/screens/login_screen/login_screen.dart';
import 'package:quizu_app/screens/otp_screen/otp_screen.dart';
import 'package:quizu_app/screens/quiz_screen/quiz_screen.dart';
import 'package:quizu_app/screens/quiz_screen/wrong_answer.dart';
import 'package:quizu_app/screens/user_name_screen/user_name_screen.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 62, 160, 202),
      ),
      routes: {
        '/': (context) => const LoginScreen(),
        OtpScreen.routeName: (context) => OtpScreen(),
        UserNameScreen.routeName: (context) => const UserNameScreen(),
        BottomNavigationBarScreen.routeName: (context) =>
            BottomNavigationBarScreen(),
        QuizScreen.routeName: (context) => const QuizScreen(),
        AfterQuizScreen.routeName: (context) => AfterQuizScreen(),
        WrongAnswer.routeName: (context) => const WrongAnswer(),
      },
    );
  }
}
