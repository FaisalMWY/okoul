// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizu_app/screens/quiz_screen/after_quiz_screen.dart';

class QuizTimer extends StatefulWidget {
  @override
  State<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  Duration duration = const Duration(seconds: 120);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => addTime(),
    );
  }

  addTime() {
    const subtractSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds - subtractSeconds;

      if (seconds <= 0) {
        timer?.cancel();
        Navigator.of(context).pushReplacementNamed(AfterQuizScreen.routeName);
      }

      duration = Duration(seconds: seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int number) => number.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$minutes : $seconds',
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
