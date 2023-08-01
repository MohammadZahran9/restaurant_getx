import 'package:get/get.dart';

import '../model/restaurantmodel.dart';
import 'package:http/http.dart' as http;

class ModelController extends GetxController {
  Future<List<Restaurant>> getdata(http.Client client) async {
    final response = await http
        .get(Uri.parse("https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad"));
    if (response.statusCode == 200) {
      final List<Restaurant> list = restaurantFromJson(response.body);
      return list;
    }
    update();
    throw "error";
  }
}
