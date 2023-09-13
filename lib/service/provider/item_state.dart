class ItemState {
  final bool loading;
  final bool error;
  final String? errorMessage;
  final int? selectedItem;
  final List<Map<String, dynamic>>? filteredDetails;

  ItemState({
    required this.loading,
    required this.error,
    required this.errorMessage,
    required this.selectedItem,
    required this.filteredDetails,
  });

  factory ItemState.initial() {
    return ItemState(
      loading: false,
      error: false,
      errorMessage: "",
      selectedItem: null,
      filteredDetails: [],
    );
  }

  ItemState copyWith({
    bool? loading,
    bool? error,
    String? errorMessage,
    int? selectedItem,
    List<Map<String, dynamic>>? filteredDetails,
  }) {
    return ItemState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedItem: selectedItem ?? this.selectedItem,
      filteredDetails: filteredDetails ?? this.filteredDetails,
    );
  }
}
