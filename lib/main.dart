import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_getx/view/Cart/Cart.dart';

import 'view/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [GetPage(name: "/Cart", page: () => Cart())],
      home: Home(),
    );
  }
}
