// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LetsGo extends StatefulWidget {
  const LetsGo({super.key});

  @override
  State<LetsGo> createState() => _LetsGoState();
}

class _LetsGoState extends State<LetsGo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 253, 241),
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
                  color: Colors.orange,
                  shadows: const [
                    Shadow(
                      blurRadius: 40.0,
                      offset: Offset(2.0, 2.0),
                      color: Colors.grey,
                    )
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
            //   Container(
            //     alignment: Alignment.bottomCenter,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50),
            //       color: Colors.black,
            //     ),
            //   ),
            Container(
              alignment: Alignment(0.0, 0.9),
              child: Text(
                "mmmFood",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 99, 179, 43),
                  shadows: const [
                    Shadow(
                      blurRadius: 40.0,
                      offset: Offset(2.0, 2.0),
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
