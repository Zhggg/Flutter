import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui1/service/categoryprovider.dart';
import 'package:ui1/service/provider/category_provider.dart';
import './../model/categoryInfo.dart';

class CategoryData extends ConsumerStatefulWidget {
  const CategoryData({super.key});

  @override
  ConsumerState<CategoryData> createState() => _CategoryDataState();
}

class _CategoryDataState extends ConsumerState<CategoryData> {
  // int? selectedCategory;
  // List<Map<String, dynamic>> filteredItems = [];

  // void filterItems(int categoryId) {
  //   selectedCategory = categoryId;
  //   filteredItems = allItemsData
  //       .where((item) => (item['cid'] as int) == categoryId)
  //       .toList();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final categoryProv = ref.watch(categProvider.notifier);
    final categoryState = ref.watch(categProvider);

    return Column(
      children: [
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allCategoriesRawData.length,
            itemBuilder: (context, index) {
              final item = allCategoriesRawData[index];
              return GestureDetector(
                onTap: () {
                  categoryProv.filterItems(item['cid']);
                },
                child: Card(
                  color: categoryState.selectedCategory == item['cid']
                      ? Colors.grey
                      : Colors.white,
                  child: Stack(
                    children: [
                      Image.asset(
                        item["photo"],
                        width: 272,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 58.0,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          item['title'],
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Divider(),
        if (categoryState.loading) Center(child: CircularProgressIndicator()),
        if (!categoryState.loading)
          const Text(
            "Items",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 128, 128),
            ),
          ),
        Container(
          // height: MediaQuery.sizeOf(context).height * 0.5,
          child: GridView.builder(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10),
            itemCount: (categoryState.filteredItems ?? []).length,
            itemBuilder: (context, index) {
              final item = (categoryState.filteredItems ?? [])[index];
              return Card(
                child: GestureDetector(
                  child: Column(
                    children: [
                      Image.asset(
                        item["photo"],
                        width: 200,
                        height: 170,
                        fit: BoxFit.fitHeight,
                      ),
                      Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
