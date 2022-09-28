import 'dart:async';
import 'package:flutter/material.dart';

class AfterQuizScreen extends StatelessWidget {
  static const String routeName = 'after-quiz';
  final int? userScore;
  final Timer? time;
  AfterQuizScreen({super.key, this.userScore, this.time});

  @override
  Widget build(BuildContext context) {
    final quizScore = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const Text(
            'Congragulations! 🎉🎊',
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          Text(
            'You\'re score is $quizScore',
            style: const TextStyle(fontSize: 28),
          ),
        ],
      ),
    );
  }
}
