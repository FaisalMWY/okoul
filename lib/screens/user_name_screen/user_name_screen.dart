import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:quizu_app/screens/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:quizu_app/screens/home_screen/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserNameScreen extends StatelessWidget {
  static const routeName = 'user-name-screen';

  const UserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  const Center(
                    child: Text(
                      'Verify Phone No.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SvgPicture.asset(
                'assets/svgs/undraw_profile_data_re_v81r.svg',
                height: 300,
              ),
            ),
            TextField(
              controller: userName,
              decoration: const InputDecoration(
                hintText: 'userName.',
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,
              ),
            ),
            MaterialButton(
              onPressed: () {
                FlutterSecureStorage storage = FlutterSecureStorage();
                print(storage.read(key: 'token'));
                username(userName.text);
                Navigator.of(context)
                    .pushReplacementNamed(BottomNavigationBarScreen.routeName);
              },
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Check',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> username(name) async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
    var response = await http.post(
      Uri.parse(
        'https://quizu.okoul.com/Name',
      ),
      headers: {
        'Authorization': token!,
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {"name": name},
    );
    print(response.body);
    return response.body;
  }
}
