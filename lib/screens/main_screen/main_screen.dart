import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu_app/app_urls/app_urls.dart';
import 'dart:convert' as convert;
import 'package:restaurant_menu_app/constants/color_constatns.dart';
import 'package:restaurant_menu_app/constants/font_constants.dart';
import 'package:restaurant_menu_app/controller/category_controller.dart';
import 'package:restaurant_menu_app/controller/order_controller.dart';
import 'package:restaurant_menu_app/models/category.dart';
import 'package:restaurant_menu_app/models/category_item.dart';
import 'package:restaurant_menu_app/widgets/category_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.storeName,}) : super(key: key);

  final String storeName;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  List<Category> categories = [
    Category(id: 1, title: 'Drink'),
    Category(id: 2, title: 'Pizza'),
    Category(id: 3, title: 'Coffee'),
  ];

  List<List<ItemOfCategory>> categoryItems = [
    [
      ItemOfCategory(title: "Colla", id: 1, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Coffee", id: 2, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Tea", id: 3, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Dio", id: 4, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Sprite", id: 5, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Seven Up", id: 6, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Pepsi", id: 7, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Dos", id: 8, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),

    ],
    [
      ItemOfCategory(title: "Cheese Pizza", id: 9, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Vege Piza", id: 10, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 11, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 12, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 13, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 14, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 15, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 16, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),

    ],
    [
      ItemOfCategory(title: "Colla", id: 17, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 18, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 19, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 20, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 21, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 22, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 23, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),
      ItemOfCategory(title: "Colla", id: 24, category: "Drink", cId: 1, image: "https://source.unsplash.com/user/c_v_r", price: 3.5),

    ]
  ];


  CategoryController categoryController = Get.put(CategoryController());

  OrderController orderController = Get.put(OrderController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.storeName,
          style: FontConstants.k24KurdishBold(22, Colors.white),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeColor: Colors.black,
              badgeContent: Text(
                "${orderController.subOrders.length}",
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  onPressed: () {
                    Get.toNamed('/basket-screen')!.then((isOrdered) {

                       setState(() {});

                    });
                  },
                  icon: Icon(Icons.shopping_cart)),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Categories',
              style: FontConstants.k24KurdishBold(30, Colors.black),
            ),
          ),
          Container(
            height: 80,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {

                    setState(() {
                      categoryController.updateCategory(index);
                    });
                  },
                  child: Obx(
                        () => Container(
                      margin: EdgeInsets.all(8),
                      width: 170,
                      child: Center(
                        child: Text(
                          categories[index].title,
                          style: FontConstants.k24KurdishLight(
                              28, Colors.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color:
                        categoryController.selectedCategory.value ==
                            index
                            ? Colors.red.shade300
                            : ColorConstants.pinkLight,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 1.0, color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                );
              },
              itemCount: categories.length,
            )
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Items',
              style: FontConstants.k24KurdishBold(30, Colors.black),
            ),
          ),
          SingleChildScrollView(
            child: Obx(
              () => GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:
                  categoryItems[categoryController.selectedCategory.value].map(
                        (categoryItem) => CategoryItemWidget(
                      onPressed: <Void>(isAddingItem) {
                        print('The selected value is $isAddingItem');
                        if (isAddingItem) {
                          // means the sign is plus not minus.
                          // Adding category item.
                          orderController
                              .addCategoryItemToSubOrders(categoryItem);
                        } else {
                          // Deleting category item from orders.
                          orderController
                              .deleteCategoryItemFromSubOrders(
                              categoryItem);
                        }
                      },
                      itemOfCategory: categoryItem,
                    ),
                  ).toList(),

              )
            ),
          )
        ],
        physics: BouncingScrollPhysics(),
      ),
    );
  }

}
