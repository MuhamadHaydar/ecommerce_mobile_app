import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restaurant_menu_app/constants/font_constants.dart';

class HelperWidget{

  static void showDialog(String title, String content, VoidCallback onPressed) {
    Get.defaultDialog(
        title: title,
        titleStyle: FontConstants.k24KurdishBold(24, Colors.black),
        content: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            content,
            style: FontConstants.k24KurdishLight(20, Colors.black),
          ),
        ),
        barrierDismissible: true,
        radius: 5,
        actions: [
          RaisedButton(
            onPressed: onPressed,
            child: Text(
              'Ok',
              style:
              FontConstants.k24KurdishBold(22, Colors.black),
            ),
            color: Colors.white,
          ),
        ]);
  }

  static void showLoadingDialog() {
    Get.defaultDialog(
      title: "Loading",
      titleStyle: FontConstants.k24KurdishBold(24, Colors.black),
      radius: 5,
      content: Container(
        child: Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        )),
      ),
    );
  }

  static void showNotNetworkConnectionDialog(){
    Get.snackbar(
      'Warning', // title
      'No Internet Connection',
      icon: Icon(
        Icons.warning,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 0,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black,
    );
  }
}