import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui1/model/categoryInfo.dart';
import 'package:ui1/service/provider/item_state.dart';

final itemProvider =
    StateNotifierProvider<ItemProvider, ItemState>((ref) => ItemProvider());

class ItemProvider extends StateNotifier<ItemState> {
  ItemProvider() : super(ItemState.initial());
  Future<void> filterDetails(int itemId) async {
    state = state.copyWith(
      loading: true,
      selectedItem: itemId,
    );

    await Future.delayed(const Duration(milliseconds: 1));

    try {
      state = state.copyWith(
          loading: false,
          filteredDetails: allItemsData
              .where((itemDetails) => (itemDetails['iid'] as int) == itemId)
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
