import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0),
          radius: 60,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png')),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Name: ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              ' sans',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Mobile: ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              ' +1 384 957 465',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          endIndent: 15,
          indent: 15,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'My Scores',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        ListView(
          shrinkWrap: true,
          children: [
            Text(
              '${DateTime.now()} 30',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              '${DateTime.now()} 30',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              '${DateTime.now()} 30',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ],
    );
  }
}
