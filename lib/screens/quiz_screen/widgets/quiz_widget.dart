import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quizu_app/screens/quiz_screen/after_quiz_screen.dart';
import 'package:quizu_app/screens/quiz_screen/widgets/quiz_timer.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  //for data featching status
  String errmsg = "";
  //to assing any error message from API/runtime
  List questions = [];
  int score = 0;
  bool skipped = false;
  int index = 0;

  @override
  void initState() {
    getData(); //fetching data
    super.initState();
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
    return Column(
      children: [
        FittedBox(
          child: Text(
            questions[index]['Question'],
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .20,
          child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ),
          ],
        )
      ],
    );
  }
}
