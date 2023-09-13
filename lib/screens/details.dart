import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui1/model/categoryInfo.dart';

import '../service/provider/item_provider.dart';

class Details extends ConsumerStatefulWidget {
  const Details({super.key});
  @override
  ConsumerState<Details> createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<Details> {
  @override
  Widget build(BuildContext context) {
    // final itemProv = ref.watch(itemProvider.notifier);
    final itemState = ref.watch(itemProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 249, 249),
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 0, 128, 128),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Details",
          style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 0, 128, 128),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Color.fromARGB(255, 0, 128, 128),
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Color.fromARGB(255, 0, 128, 128),
              )),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.red,
            ),
            height: 657.2,
            width: 450,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: (itemState.filteredDetails ?? []).length,
              itemBuilder: (context, index) {
                final itemDetails = (itemState.filteredDetails ?? [])[index];
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25.0),
                      padding: const EdgeInsets.all(20.0),
                      height: 300,
                      alignment: Alignment.center,
                      child: Image.asset(itemDetails["photo"]),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 315),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 0, 128, 128),
                      ),
                      height: 343,
                      width: 400,
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.amber,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            height: 70,
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Text(
                                  itemDetails['title'],
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1.5,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            // alignment: Alignment.topLeft,
                            height: 150,
                            // color: Colors.amber,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                  // color: Colors.red,
                                  height: 150,
                                  child: const Text(
                                    "Description:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.red,
                                  height: 125,
                                  width: 276,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    itemDetails['detail'],
                                    maxLines: 7,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
