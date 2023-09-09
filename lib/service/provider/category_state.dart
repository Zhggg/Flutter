class CategoryState {
  final bool loading;
  final bool error;
  final String errorMessage;
  final int selectedCategory;
  final List<Map<String, dynamic>> filteredItems;

  CategoryState(this.loading, this.error, this.errorMessage,
      this.selectedCategory, this.filteredItems);
}
