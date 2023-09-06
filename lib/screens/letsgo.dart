// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui1/screens/login.dart';

class LetsGo extends ConsumerStatefulWidget {
  const LetsGo({super.key});

  @override
  ConsumerState<LetsGo> createState() => _LetsGoState();
}

class _LetsGoState extends ConsumerState<LetsGo> {
  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment(0.0, 0.45),
              child: Text(
                "FOOD",
                style: TextStyle(
                  fontSize: 152,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 255, 165, 0),
                  shadows: const [
                    Shadow(
                      blurRadius: 40.0,
                      offset: Offset(2.0, 2.0),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.0, -0.3),
              child: Image(
                image: AssetImage("assets/images/bowl.png"),
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.9),
              child: OutlinedButton(
                onPressed: _navigateToLogin,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Color.fromARGB(255, 65, 168, 65),
                        ),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
                child: Text(
                  "Lets Go",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 128, 128),
                    shadows: const [
                      Shadow(
                        blurRadius: 40.0,
                        offset: Offset(2.0, 2.0),
                        color: Colors.grey,
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
