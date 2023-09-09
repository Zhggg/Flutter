import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui1/model/category_data_model.dart';

import '../model/categoryInfo.dart';

// final jsonProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
//     final jsonStr = await rootBundle.loadString("assets/category.json");
//     final jsonData = json.decode(jsonStr) as List<dynamic>;

//     return jsonData.cast<Map<String, dynamic>>();

//     var categories = cat;
//     (categories as String);
//   });

//   return jsonData.map((item) {
//     return CategoryDataModel(
//       item['cid'] as int,
//       item['title'] as String,
//       item['photo'] as String,
//     );
//   }).toList();
// });

// Future<List<CategoryDataModel>?> getCategories() async {

//   List<CategoryDataModel> allCateogries = [];
//   try {

//     for(final categ in allCategoriesRawData){
// allCateogries.add(CategoryDataModel)
//     }

//   } catch (e) {
//     return null;
//   }
// }

// List<Map<String, dynamic>> filterItems(int categoryId) {
//   return allItemsData
//       .where((item) => (item['cid'] as int) == categoryId)
//       .toList();
// }
