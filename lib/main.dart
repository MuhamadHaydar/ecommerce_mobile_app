import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:restaurant_menu_app/screens/basket_screen/basket_screen.dart';
import 'package:restaurant_menu_app/screens/detail_screen/detail_screen.dart';
import 'package:restaurant_menu_app/screens/main_screen/main_screen.dart';

import 'constants/text_constants.dart';
import 'screens/store_screen/store_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // in order to force portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title:TextConstants.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: '/store-screen',
      defaultTransition: Transition.downToUp,
      getPages: [
        GetPage(
          name:'/store-screen',
          page: ()=> StoreScreen(),
        ),
        GetPage(
          name: '/detail-screen',
          page: () => DetailScreen(),
        ),
        GetPage(
          name: '/basket-screen',
          page: () => BasketScreen(),
        ),
      ],
    );
  }
}

