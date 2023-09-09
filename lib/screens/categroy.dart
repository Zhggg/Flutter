import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui1/service/categoryprovider.dart';
import './../model/categoryInfo.dart';

class CategoryData extends ConsumerStatefulWidget {
  const CategoryData({super.key});

  @override
  ConsumerState<CategoryData> createState() => _CategoryDataState();
}

class _CategoryDataState extends ConsumerState<CategoryData> {
  // final jsonProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  //   final jsonStr = await rootBundle.loadString("assets/category.json");
  //   final jsonData = json.decode(jsonStr) as List<dynamic>;

  //   return jsonData.cast<Map<String, dynamic>>();

  //   var categories = cat;
  //   log(categories as String);
  // });

  int? selectedCategory;
  List<Map<String, dynamic>> filteredItems = [];

  void filterItems(int categoryId) {
    selectedCategory = categoryId;
    filteredItems = allItemsData
        .where((item) => (item['cid'] as int) == categoryId)
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("asdasd"),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allCategoriesRawData.length,
            itemBuilder: (context, index) {
              final item = allCategoriesRawData[index];
              return GestureDetector(
                onTap: () {
                  filterItems(item['cid']);
                },
                child: Card(
                  color: selectedCategory == item['cid']
                      ? Colors.red
                      : Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        item["photo"],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Text(item['title'])
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Divider(),
        Container(
          // height: MediaQuery.sizeOf(context).height * 0.5,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              final item = filteredItems[index];
              return Card(
                child: Column(
                  children: [
                    Image.asset(
                      item["photo"],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(item['title'])
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
    // final categories = ref.watch(jsonProvider);
    // return categories.when(
    //   data: (categories) {
    // return SizedBox(
    //   height: 150,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: categories.length,
    //     itemBuilder: (context, index) {
    //       final item = categories[index];
    //       return Card(
    //         child: Column(
    //           children: [
    //             Image.asset(
    //               item["photo"],
    //               width: 100,
    //               height: 100,
    //               fit: BoxFit.cover,
    //             ),
    //             Text(item['title'])
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
    //   },
    //   loading: () => const CircularProgressIndicator(),
    //   error: (error, stackTrace) => const Text("Error loading data"),
    // );
  }
}
