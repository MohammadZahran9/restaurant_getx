import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_getx/view/menu/restaurantmenu.dart';
import '../controller/modelcontroller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ModelController>(
      init: ModelController(),
      builder: (Mcontroller) {
        return FutureBuilder(
          future: Mcontroller.getdata(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return ResMenu(Category: snapshot.data!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    ));
  }
}
