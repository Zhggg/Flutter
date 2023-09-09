import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui1/model/categoryInfo.dart';
import 'package:ui1/service/provider/category_state.dart';

final categProvider = StateNotifierProvider<CategoryProvider, CategoryState>(
    (ref) => CategoryProvider());

class CategoryProvider extends StateNotifier<CategoryState> {
  CategoryProvider() : super(CategoryState.initial());

  Future<void> filterItems(int categoryId) async {
    state = state.copyWith(
      loading: true,
      selectedCategory: categoryId,
    );

    await Future.delayed(Duration(seconds: 1));

    try {
      state = state.copyWith(
          loading: false,
          filteredItems: allItemsData
              .where((item) => (item['cid'] as int) == categoryId)
              .toList());
    } catch (e) {
      state = state.copyWith(
        loading: false,
        error: true,
        errorMessage: "Something went wrong!",
      );
    }
  }
}
