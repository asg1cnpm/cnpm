import 'package:flutter/material.dart';
import 'model.dart';

List<DishCategory> dishCategory = List.generate(
  5,
  (cateIndex) => DishCategory(
    cateIndex,
    "Type $cateIndex",
    "assets/icons/burger_beer.svg",
    List.generate(
      9,
      (dishIndex) => DishItem(
          cateIndex * 10 + dishIndex,
          "Dish ${cateIndex * 10 + dishIndex}",
          10.0,
          "assets/icons/chinese_noodles.svg"),
    ),
  ),
);

// List<CartItem> selectedItem =[];

class SelectedItemProvider extends ChangeNotifier {
  int tempDetailQuantity = 1;
  void increaseTemp() {
    tempDetailQuantity++;
    notifyListeners();
  }

  void decreaseTemp() {
    tempDetailQuantity == 1 ? {} : tempDetailQuantity--;
    notifyListeners();
  }

  List<CartItem> selectedItem = [];
  void add(int cateIndex, int index) {
    CartItem newItem = CartItem(
        dishCategory[cateIndex].listDishItem[index], tempDetailQuantity);
    int idx = selectedItem.indexWhere((element) =>
        element.selectedDish.itemID == newItem.selectedDish.itemID);
    idx == -1
        ? selectedItem.add(newItem)
        : selectedItem[idx].quantity += tempDetailQuantity;
    tempDetailQuantity = 1;
    notifyListeners();
  }

  void decrease(int index) {
    selectedItem[index].quantity == 1 ? {} : selectedItem[index].quantity--;
    notifyListeners();
  }

  void increase(int index) {
    selectedItem[index].quantity++;
    notifyListeners();
  }

  void remove(int id) {
    selectedItem.removeWhere((element) => element.selectedDish.itemID == id);
    selectedItem.join();
    notifyListeners();
  }

  int totalitem() {
    int total = 0;
    for (int i = 0; i < selectedItem.length; i++) {
      total += selectedItem[i].quantity;
    }
    return total;
  }

  double total() {
    double _total = 0;
    for (int i = 0; i < selectedItem.length; i++) {
      _total += selectedItem[i].quantity * selectedItem[i].selectedDish.price;
    }
    return _total;
  }
}
