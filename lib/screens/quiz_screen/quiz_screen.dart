import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizu_app/screens/quiz_screen/after_quiz_screen.dart';
import 'package:quizu_app/screens/quiz_screen/widgets/quiz_timer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quizu_app/screens/quiz_screen/widgets/quiz_widget.dart';

class QuizScreen extends StatefulWidget {
  static const String routeName = 'quiz-screen';
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Duration duration = const Duration(seconds: 1000);
  Timer? timer;
  List questions = [];
  int score = 0;
  bool skipped = false;
  int index = 0;

  @override
  void initState() {
    super.initState();
    getData();
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
        Navigator.of(context)
            .pushReplacementNamed(AfterQuizScreen.routeName, arguments: score);
      }

      duration = Duration(seconds: seconds);
    });
  }

  getData() async {
    //don't use "http://localhost/" use local IP or actual live URL
    FlutterSecureStorage storage = const FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    http.Response response = await http.get(
      Uri.parse(
        'https://quizu.okoul.com/Questions',
      ),
      headers: {'Authorization': token!},
    );
    questions = jsonDecode(response.body); //get JSON decoded data from response

    // print(questions); //printing the JSON recieved

    if (response.statusCode < 300) {
      //fetch successful
      print(questions.length);
      setState(() {}); //refresh UI
    }
  }

  @override
  Widget build(BuildContext context) {
    String wrongAnswerMessage = '';
    Color color = Colors.black;
    String twoDigits(int number) => number.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.change_circle,
              color: Colors.red,
            ),
          ),
        ],
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Quiz Time! ⏰'),
        backgroundColor: Colors.white.withOpacity(0),
        shadowColor: Colors.white.withOpacity(0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$minutes : $seconds',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Column(
              children: [
                FittedBox(
                  child: Text(
                    questions[index]['Question'],
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .20,
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 60),
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if (questions[index]['correct'] == 'a') {
                            setState(() {
                              index++;
                              score++;
                              print(score);
                            });
                          } else {
                            setState(
                              () {
                                wrongAnswerMessage = 'Wrong answer try again.';
                              },
                            );
                          }
                        },
                        child: Text(
                          "a. ${questions[index]['a']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          print(questions[index]['correct']);
                          if (questions[index]['correct'] == 'b') {
                            setState(() {
                              index++;
                              score++;
                              print(score);
                            });
                          }
                        },
                        child: Text(
                          "b. ${questions[index]['b']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          print(questions[index]['correct']);
                          if (questions[index]['correct'] == 'c') {
                            setState(
                              () {
                                index++;
                                score++;
                                print(score);
                              },
                            );
                          }
                        },
                        child: Text(
                          "c. ${questions[index]['c']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          print(questions[index]['correct']);
                          if (questions[index]['correct'] == 'd') {
                            setState(() {
                              index++;
                              score++;
                              print(score);
                            });
                          }
                        },
                        child: Text(
                          "d. ${questions[index]['d']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(wrongAnswerMessage),
                ),
                MaterialButton(
                  disabledColor: Colors.grey,
                  onPressed: skipped == false
                      ? () {
                          if (skipped == false) {
                            setState(() {
                              skipped = true;
                              index++;
                              print(skipped);
                            });
                          }
                        }
                      : null,
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
