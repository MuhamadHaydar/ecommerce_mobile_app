import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu_app/app_urls/app_urls.dart';
import 'package:restaurant_menu_app/constants/color_constatns.dart';
import 'package:restaurant_menu_app/constants/font_constants.dart';
import 'package:restaurant_menu_app/models/category_item.dart';

class CategoryItemWidget extends StatefulWidget {

  const CategoryItemWidget({required this.itemOfCategory, required this.onPressed});

  final ItemOfCategory itemOfCategory;
  final Function<Void> (bool value) onPressed;

  @override
  _CategoryItemWidgetState createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {

  bool itemSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 250,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.itemOfCategory.image,
                    ))),
          ),
          Container(
            height: 250,
            width: 250,
            child: Center(
                child: Text(
              widget.itemOfCategory.title,
              style: FontConstants.k24KurdishBold(28, Colors.white),
            )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [
                  0.1,
                  0.4,
                  0.7,
                  0.9,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 45,
              decoration: BoxDecoration(
                color: ColorConstants.pinkBold,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: itemSelected ? Icon(Icons.remove) : Icon(Icons.add),
                iconSize: 30,
                color: Colors.white,
                onPressed: (){
                  setState(() {
                    itemSelected =!itemSelected;
                  });
                  widget.onPressed(itemSelected);
                },
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Text(
              "${widget.itemOfCategory.price} \$",
              style: FontConstants.k24KurdishBold(25, Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
