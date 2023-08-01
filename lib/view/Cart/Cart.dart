import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_getx/controller/cartController.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (yController) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0.0,
            actions: [
              Center(
                  child: Text(
                "Tolal: ${yController.total} SAR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ))
            ],
          ),
          backgroundColor: Colors.green,
          body: ListView.builder(
            itemCount: yController.Dishes.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Card(
                  child: ListTile(
                    title: Text(yController.Dishes[index].dishName.toString()),
                    subtitle: Row(children: [
                      Text(yController.Dishes[index].dishCurrency.name),
                      Padding(padding: EdgeInsets.only(left: 3)),
                      Text(yController.Dishes[index].dishPrice.toString()),
                    ]),
                    trailing: GestureDetector(
                      onTap: () {
                        yController.removeitem(yController.cart[index]);
                      },
                      child: Icon(Icons.remove),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
