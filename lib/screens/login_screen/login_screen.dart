import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizu_app/screens/otp_screen/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNo = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 400,
                child: SvgPicture.asset(
                  'assets/svgs/login_welcome_image.svg',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: phoneNo,
                        decoration: const InputDecoration(
                          hintText: 'Phone No.',
                          hintStyle: TextStyle(color: Colors.grey),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                            OtpScreen.routeName,
                            arguments: phoneNo.text),
                        child: Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'start',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
