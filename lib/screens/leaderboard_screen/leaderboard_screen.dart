import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '/models/top_ten.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  List apidata = [];

  @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }

  getData() async {
    setState(() {
      loading = true; //make loading true to show progressindicator
    });

    //don't use "http://localhost/" use local IP or actual live URL
    FlutterSecureStorage storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    http.Response response = await http.get(
      Uri.parse(
        'https://quizu.okoul.com/TopScores',
      ),
      headers: {'Authorization': token!},
    );
    apidata = jsonDecode(response.body); //get JSON decoded data from response

    print(apidata); //printing the JSON recieved

    if (response.statusCode < 300) {
      //fetch successful

      loading = false;
      setState(() {}); //refresh UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          children: apidata
              .map<Widget>(
                (user) => ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: Container(
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Score: ${user['score']}'),
                      ),
                    ),
                  ),
                  title: Text(
                    user['name'],
                  ),
                ),
              )
              .toList()),
    );
  }
}
