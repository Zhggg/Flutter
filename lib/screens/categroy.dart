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
        if (categoryState.loading) Center(child: CircularProgressIndicator()),
        if (!categoryState.loading)
          Container(
            // height: MediaQuery.sizeOf(context).height * 0.5,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: (categoryState.filteredItems ?? []).length,
              itemBuilder: (context, index) {
                final item = (categoryState.filteredItems ?? [])[index];
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
  }
}
