import 'package:flutter/material.dart';
import 'package:quizu_app/screens/quiz_screen/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Ready to test your knoledge and challenge others?',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        MaterialButton(
          splashColor: Theme.of(context).primaryColorLight,
          onPressed: () {
            Navigator.of(context).pushNamed(QuizScreen.routeName);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor),
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Quiz Me!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Ready to test your knoledge and challenge others?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
