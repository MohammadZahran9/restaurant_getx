import 'package:get/get.dart';
import 'package:restaurant_getx/model/restaurantmodel.dart';

class CartController extends GetxController {
  double _count = 0;
  List<CategoryDish> Dishes = [];

  void additem(CategoryDish i) {
    Dishes.add(i);
    _count += i.dishPrice;
    update();
  }

  void removeitem(CategoryDish i) {
    Dishes.remove(i);
    if (_count > 0.0) {
      _count -= i.dishPrice;
    }
    update();
  }

  int get count {
    return Dishes.length;
  }

  double get total {
    return _count;
  }

  List<CategoryDish> get cart {
    return Dishes;
  }
}
