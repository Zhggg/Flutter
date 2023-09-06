import 'package:flutter/material.dart';
import 'package:ui1/screens/letsgo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: Food()));
}

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LetsGo(),
      ),
    );
  }
}
