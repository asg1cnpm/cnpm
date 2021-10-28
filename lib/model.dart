
class DishItem {
  int itemID;
  double price;
  String dishName;
  String svgSrc;
  DishItem(this.itemID, this.dishName, this.price, this.svgSrc);
}

class DishCategory {
  int categoryID;
  String svgSrc;
  List<DishItem> listDishItem;
  String categoryName;
  DishCategory(
      this.categoryID, this.categoryName, this.svgSrc, this.listDishItem);
}

class CartItem {
  DishItem selectedDish;
  int quantity;
  CartItem(this.selectedDish, this.quantity);
}
