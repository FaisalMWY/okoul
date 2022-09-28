import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/screens/user_name_screen/user_name_screen.dart';

class OtpScreen extends StatelessWidget {
  static const routeName = 'otp-screen';
  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNo = ModalRoute.of(context)!.settings.arguments;
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
                'assets/svgs/otp.svg',
                height: 300,
              ),
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1)
                          FocusScope.of(context).nextFocus();
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1)
                          FocusScope.of(context).nextFocus();
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1)
                          FocusScope.of(context).nextFocus();
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1)
                          FocusScope.of(context).nextFocus();
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(UserNameScreen.routeName);
                print(login(phoneNo));
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

  Future login(phoneNo) async {
    FlutterSecureStorage storage = FlutterSecureStorage();

    var response = await http.post(
      Uri.parse(
        'https://quizu.okoul.com/Login',
      ),
      body: {"OTP": "0000", "mobile": phoneNo},
    );
    await storage.write(
        key: 'token', value: jsonDecode(response.body)['token']);
    print(await response.body);
    return response.body;
  }
}
