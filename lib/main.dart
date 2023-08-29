import 'package:flutter/material.dart';
import 'package:ui1/screens/letsgo.dart';

void main() {
  runApp(const Food());
}

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LetsGo(),
      ),
    );
  }
}
