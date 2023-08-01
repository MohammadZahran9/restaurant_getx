import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:restaurant_getx/controller/cartController.dart';
import 'package:restaurant_getx/model/restaurantmodel.dart';

class ResMenu extends StatelessWidget {
  ResMenu({super.key, required this.Category});

  final List<Restaurant> Category;
  final List<Color> colors = [Colors.green, Colors.red];
  final CartController Ccontroller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Category[0].tableMenuList.length,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: badges.Badge(
                  badgeContent: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (controller) {
                      return Text(controller.count.toString());
                    },
                  ),
                  child: GestureDetector(
                    onTap: () => Get.toNamed("/Cart"),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ],
            bottom: TabBar(
                unselectedLabelColor: Colors.grey[600],
                labelColor: Colors.red,
                indicatorColor: Colors.red,
                labelPadding: const EdgeInsets.all(10),
                isScrollable: true,
                tabs: List.generate(
                    Category[0].tableMenuList.length,
                    (index) => Text(Category[0]
                        .tableMenuList[index]
                        .menuCategory
                        .toString())))),
        body: TabBarView(
            children: List.generate(Category[0].tableMenuList.length, (x) {
          return ListView.builder(
            itemCount: Category[0].tableMenuList[x].categoryDishes.length,
            itemBuilder: (context, y) {
              int quantity = 0;
              return Card(
                child: ListTile(
                  leading: badges.Badge(
                    position: badges.BadgePosition.center(),
                    badgeStyle: badges.BadgeStyle(
                        badgeColor: colors[y % colors.length]),
                    child: const Icon(Icons.square_outlined),
                  ),
                  title: Text(
                    Category[0]
                        .tableMenuList[x]
                        .categoryDishes[y]
                        .dishName
                        .toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    Category[0]
                                        .tableMenuList[x]
                                        .categoryDishes[y]
                                        .dishCurrency
                                        .name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      Category[0]
                                          .tableMenuList[x]
                                          .categoryDishes[y]
                                          .dishPrice
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ],
                              ),
                              Text(
                                  "${Category[0].tableMenuList[x].categoryDishes[y].dishCalories} calories",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(Category[0]
                                .tableMenuList[x]
                                .categoryDishes[y]
                                .dishDescription
                                .toString()),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.green),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: GestureDetector(
                                          onTap: () {
                                            Ccontroller.removeitem(Category[0]
                                                .tableMenuList[x]
                                                .categoryDishes[y]);
                                            if (quantity > 0) {
                                              quantity--;
                                            }
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        )),
                                    GetBuilder<CartController>(
                                      builder: (controller) {
                                        return Text(quantity.toString(),
                                            style: const TextStyle(
                                                color: Colors.white));
                                      },
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 6),
                                        child: GestureDetector(
                                          onTap: () {
                                            Ccontroller.additem(Category[0]
                                                .tableMenuList[x]
                                                .categoryDishes[y]);
                                            quantity++;
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ))
                                  ],
                                ),
                              ))
                        ]),
                  ),
                  trailing: CachedNetworkImage(
                    imageUrl: Category[0]
                        .tableMenuList[x]
                        .categoryDishes[y]
                        .dishImage,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, progress) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.nearby_error),
                  ),
                ),
              );
            },
          );
        })),
      ),
    );
  }
}
