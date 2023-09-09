// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:ui1/model/categorymodel.dart';
// import 'package:flutter/services.dart';

// class Home extends ConsumerStatefulWidget {
//   const Home({super.key});

//   @override
//   ConsumerState<Home> createState() => _HomeState();
// }

// class _HomeState extends ConsumerState<Home> {
//   @override
//   Widget build(BuildContext context, ScopeReader watch) {
//     final category = watch(categoryProvider);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "Discover",
//           style: TextStyle(
//             fontSize: 35,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 0, 128, 128),
//           ),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.search_rounded,
//               color: Color.fromARGB(255, 0, 128, 128),
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             const Divider(
//               height: 2,
//               thickness: 1.5,
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 120,
//                     child: ListView.builder(
//                         itemCount: 10,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) => Container(
//                               height: 120,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                 image: const DecorationImage(
//                                   image: AssetImage('assets/images/burger.jpg'),
//                                   fit: BoxFit.cover,
//                                 ),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               margin: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                               ),
//                               child: Container(
//                                 alignment: Alignment.centerRight,
//                                 child: const ListTile(
//                                   leading: Text(
//                                     "Pizza",
//                                     style: TextStyle(
//                                       fontSize: 40,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )),
//                   )
//                 ],
//               ),
//             ),
//             // Container(
//             //   margin: const EdgeInsets.symmetric(vertical: 20),
//             //   height: 120,
//             //   child: ListView(
//             //     scrollDirection: Axis.horizontal,
//             //     children: [
//             //       GestureDetector(
//             //         onTap: () {
//             //           // Navigator.of(context).pushReplacement(
//             //           //   MaterialPageRoute(builder: (context) => Login()),
//             //           // );
//             //         },
//             //         child: Container(
//             //           decoration: BoxDecoration(
//             //             borderRadius: BorderRadius.circular(20),
//             //             color: const Color.fromARGB(255, 244, 67, 54),
//             //           ),
//             //           margin: const EdgeInsets.symmetric(horizontal: 10.0),
//             //           width: 150,
//             //           child: Stack(
//             //             children: [
//             //               Container(
//             //                 alignment: const Alignment(0.9, 0.9),
//             //                 child: const Image(
//             //                   image: AssetImage("assets/images/bowl.png"),
//             //                 ),
//             //               ),
//             //               Container(
//             //                 alignment: const Alignment(-0.9, -0.9),
//             //                 child: const Text(
//             //                   "Pizza",
//             //                   style: TextStyle(
//             //                     fontSize: 20,
//             //                     fontWeight: FontWeight.bold,
//             //                     color: Colors.white,
//             //                   ),
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         ),
//             //       ),
//             //       Container(
//             //         width: 150,
//             //         decoration: BoxDecoration(
//             //           image: const DecorationImage(
//             //               image: AssetImage("assets/images/burger.jpg"),
//             //               fit: BoxFit.cover),
//             //           borderRadius: BorderRadius.circular(20),
//             //         ),
//             //         margin: const EdgeInsets.symmetric(horizontal: 10.0),

//             //         // color: Colors.blue,
//             //         child: Container(
//             //           alignment: Alignment.center,
//             //           child: const Text(
//             //             "Burger",
//             //             style: TextStyle(
//             //               fontSize: 40,
//             //               fontWeight: FontWeight.bold,
//             //               color: Colors.white,
//             //               shadows: [
//             //                 Shadow(
//             //                   blurRadius: 40.0,
//             //                   color: Colors.grey,
//             //                   offset: Offset(2.0, 2.0),
//             //                 ),
//             //               ],
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //       Container(
//             //         margin: const EdgeInsets.symmetric(horizontal: 10.0),
//             //         width: 150,
//             //         color: Colors.yellow,
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             const Divider(
//               height: 10.0,
//               thickness: 1.5,
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 450,
//                     child: ListView.builder(
//                         itemCount: 20,
//                         scrollDirection: Axis.vertical,
//                         itemBuilder: (context, index) => Container(
//                               height: 70,
//                               width: 100,
//                               color: Colors.amber,
//                               margin: const EdgeInsets.symmetric(
//                                 vertical: 10.0,
//                               ),
//                               child: ListTile(
//                                 leading: Image.asset('assets/images/bowl.png'),
//                                 title: const Text("Pizza"),
//                                 subtitle: const Text("Tasty"),
//                               ),
//                             )),
//                   ),
//                 ],
//               ),
//             ),
//             // SingleChildScrollView(
//             //   child: SizedBox(
//             //     height: 411,
//             //     child: ListView(
//             //       scrollDirection: Axis.vertical,
//             //       children: [
//             //         Column(
//             //           children: [
//             //             ListTile(
//             //               leading: Image.asset('assets/images/bowl.png'),
//             //               title: Text("Pizza"),
//             //               subtitle: Text("Tasty"),
//             //               tileColor: Colors.amber,
//             //             ),
//             //             ListTile(
//             //               leading: Image.asset('assets/images/bowl.png'),
//             //               title: Text("Pizza"),
//             //               subtitle: Text("Tasty"),
//             //               tileColor: Colors.blue,
//             //             ),
//             //             ListTile(
//             //               leading: Image.asset('assets/images/bowl.png'),
//             //               title: Text("Pizza"),
//             //               subtitle: Text("Tasty"),
//             //               tileColor: Colors.red,
//             //             ),
//             //             ListTile(
//             //               leading: Image.asset('assets/images/bowl.png'),
//             //               title: Text("Pizza"),
//             //               subtitle: Text("Tasty"),
//             //             ),
//             //             ListTile(
//             //               leading: Image.asset('assets/images/bowl.png'),
//             //               title: Text("Pizza"),
//             //               subtitle: Text("Tasty"),
//             //             ),
//             //             ListTile(
//             //               leading: Image.asset('assets/images/bowl.png'),
//             //               title: Text("Pizza"),
//             //               subtitle: Text("Tasty"),
//             //             ),
//             //             ListTile(
//             //               leading: Image.asset('assets/images/bowl.png'),
//             //               title: Text("Pizza"),
//             //               subtitle: Text("Tasty"),
//             //             ),
//             //             ListTile(
//             //               leading: Image.asset('assets/images/bowl.png'),
//             //               title: Text("Pizza"),
//             //               subtitle: Text("Tasty"),
//             //             ),
//             //           ],
//             //         ),
//             //         // Container(
//             //         //   margin: EdgeInsets.symmetric(vertical: 10),
//             //         //   height: 50,
//             //         //   child: Text("okay"),
//             //         //   color: Colors.yellow,
//             //         // ),
//             //         // Container(
//             //         //   margin: EdgeInsets.symmetric(vertical: 10),
//             //         //   child: Text("okay"),
//             //         //   color: Colors.red,
//             //         // ),
//             //         // Container(
//             //         //   margin: EdgeInsets.symmetric(vertical: 10),
//             //         //   child: Text("okay"),
//             //         //   color: Colors.blue,
//             //         // ),
//             //         // Container(
//             //         //   margin: EdgeInsets.symmetric(vertical: 10),
//             //         //   child: Text("okay"),
//             //         //   color: Colors.green,
//             //         // ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
      
  //   );
  // }

//   final categoryProvider = FutureProvider<List<CategoryDataModel>>((ref) async {
//     final jsonStr = await rootBundle.loadString('assets/category.dart');
//     final jsonData = json.decode(jsonStr) as List<dynamic>;

//     return jsonData.map((item) {
//       return CategoryDataModel(
//         item['cid'] as int,
//         item['title'] as String,
//         item['photo'] as String,
//       );
//     }).toList();
//   });
// }
