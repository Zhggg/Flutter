import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Discover",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 128, 128),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              color: Color.fromARGB(255, 0, 128, 128),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Divider(
              height: 2,
              thickness: 1.5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 150,
                    child: Stack(
                      children: [
                        Container(
                          alignment: const Alignment(0.9, 0.9),
                          child: const Image(
                            image: AssetImage("assets/images/bowl.png"),
                          ),
                        ),
                        Container(
                          alignment: const Alignment(-0.9, -0.9),
                          child: const Text(
                            "Pizza",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/burger.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),

                    // color: Colors.blue,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Burger",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 40.0,
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 150,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
