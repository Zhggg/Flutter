import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui1/screens/categroy.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 2,
              thickness: 1.5,
            ),
            CategoryData(),
            Divider(
              height: 10.0,
              thickness: 1.5,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const GNav(
          backgroundColor: Color.fromARGB(255, 255, 165, 0),
          color: Colors.white,
          activeColor: Colors.white,
          gap: 8,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Likes",
            ),
            GButton(
              icon: Icons.history,
              text: "History",
            ),
            GButton(
              icon: Icons.menu,
              text: "Menu",
            ),
          ]),
    );
  }
}
