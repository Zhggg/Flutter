class CategoryDataModel {
  final int cid;
  final String title;
  final String photo;

  CategoryDataModel(this.cid, this.title, this.photo);
}

class ItemDataModel {
  final int iid;
  final String title;
  final String photo;
  final String detail;

  ItemDataModel(this.iid, this.title, this.photo, this.detail);
}
