class CategoryState {
  final bool loading;
  final bool error;
  final String? errorMessage;
  final int? selectedCategory;
  final List<Map<String, dynamic>>? filteredItems;

  CategoryState({
    required this.loading,
    required this.error,
    required this.errorMessage,
    required this.selectedCategory,
    required this.filteredItems,
  });

  factory CategoryState.initial() {
    return CategoryState(
      loading: false,
      error: false,
      errorMessage: "",
      selectedCategory: null,
      filteredItems: [],
    );
  }

  CategoryState copyWith({
    bool? loading,
    bool? error,
    String? errorMessage,
    int? selectedCategory,
    List<Map<String, dynamic>>? filteredItems,
  }) {
    return CategoryState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }
}
