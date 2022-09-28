import 'package:flutter/material.dart';
import 'package:quizu_app/screens/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:quizu_app/screens/home_screen/home_screen.dart';
import 'package:quizu_app/screens/quiz_screen/quiz_screen.dart';

class WrongAnswer extends StatelessWidget {
  static const String routeName = 'wrong-answer';
  const WrongAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const Text(
            'Wrong answer, try again.',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(QuizScreen.routeName);
                },
                color: Colors.grey[300],
                elevation: 5,
                child: Text(
                  'Up for another try?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              MaterialButton(
                padding: EdgeInsets.all(5),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                      BottomNavigationBarScreen.routeName);
                },
                color: Colors.grey[300],
                elevation: 5,
                child: Text(
                  ', or did you gave up already?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).errorColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
