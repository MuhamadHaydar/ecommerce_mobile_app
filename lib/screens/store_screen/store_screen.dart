import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu_app/constants/color_constatns.dart';
import 'package:restaurant_menu_app/constants/font_constants.dart';
import 'package:restaurant_menu_app/models/store.dart';
import 'package:restaurant_menu_app/screens/main_screen/main_screen.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key,}) : super(key: key);


  final List<Store> stores = [
    Store(
        id: 1,
        title: "City Mall",
        availableItemsForDeals: 200,
        imageUrl:
            "https://media-cdn.tripadvisor.com/media/photo-s/0f/6f/99/fb/city-mall.jpg",
        location: "Masif Street, Erbil"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stores',
          style: FontConstants.k24KurdishBold(22, Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.to(MainScreen(storeName: stores[index].title,));
                  },
                  child: Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorConstants.greyLightDim,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: ClipRRect(
                            child: Image.network(stores[index].imageUrl),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  stores[index].title,
                                  style: FontConstants.k24KurdishBold(
                                      22, Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  stores[index].location,
                                  style: FontConstants.k24KurdishLight(
                                      18, Colors.black),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  '${stores[index].availableItemsForDeals} items discounted!',
                                  style: FontConstants.k24KurdishBold(
                                      16, Colors.black),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    height: 2,
                  ),
                );
              },
              itemCount: stores.length),
        ),
      ),
    );
  }
}
