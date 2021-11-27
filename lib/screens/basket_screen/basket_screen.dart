
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu_app/app_urls/app_urls.dart';
import 'package:restaurant_menu_app/constants/color_constatns.dart';
import 'package:restaurant_menu_app/constants/font_constants.dart';
import 'package:restaurant_menu_app/controller/order_controller.dart';
import 'package:restaurant_menu_app/models/order.dart';
import 'package:restaurant_menu_app/utils/networking_utils.dart';
import 'package:restaurant_menu_app/widgets/helper_widget.dart';

import 'package:restaurant_menu_app/widgets/quantity_item_widget.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {

  OrderController orderController = Get.put(OrderController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Cart",
          style: FontConstants.k24KurdishBold(22, Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Your basket contains ${orderController.subOrders.length} items:",
              style: FontConstants.k24KurdishBold(22, Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.68,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction){
                        setState(() {
                          orderController.deleteCategoryItemFromSubOrdersWithIndex(index);
                        });
                      },
                      background: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.cancel, color: Colors.white, size: 50,),
                              Icon(Icons.cancel, color: Colors.white, size: 50,),
                            ],
                          ),
                        ),
                        color: Colors.red,
                      ),

                      key:ValueKey(orderController.subOrders[index].menu),
                      child: Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: ColorConstants.greyLightDim,
                            borderRadius: BorderRadius.circular(15),),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 5,
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: ClipRRect(
                                      child: Image.network(
                                        orderController.subOrders.value[index].imageUrl,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Text(
                                            orderController.subOrders.length == 0 ? " ": orderController.subOrders[index].title,
                                            style: FontConstants.k24KurdishBold(
                                                18, Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Obx(()=> Flexible(
                                          flex: 1,
                                          child: Text(
                                            orderController.subOrders.length == 0 ? " ":'\$ ${ orderController.subOrders[index].totalCost.toStringAsFixed(2)}',
                                              style: FontConstants.k24KurdishBold(
                                                  20, Colors.black),
                                            ),
                                        ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              flex:4,
                              child: QuantityItemWidget(
                                quantity: orderController.subOrders[index].quantity,
                                onPressed:  <Void>( quantity){
                                  print(' Your item cost is ${orderController.subOrders[index].cost}');
                                  print(' Your item quantity is $quantity');
                                  // First we measure total cost with specified quantity and cost value.
                                  double totalCost = orderController.subOrders[index].cost * quantity;
                                  // Second we update total cost and quantity.
                                  orderController.updateQuantityOfIndexSubOrder(index: index, quantity: quantity, totalCost: totalCost);
                                  setState(() {
                                  });
                                  print(' Your item quantity is ${orderController.subOrders[index].quantity}');
                                  print(' Your item total cost is ${orderController.subOrders[index].totalCost}');

                                },
                              ),
                            ),
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
                  itemCount: orderController.subOrders.length),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 2),
                blurRadius: 6)
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(

              flex: 5,
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: Text(
                      'Total:',
                      style: FontConstants.k24KurdishBold(22, Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Obx(()=> Flexible(
                    flex: 5,
                    child: Text(
                        '\$ ${orderController.totalSubOrdersCost.value.toStringAsFixed(2)}',
                        style: FontConstants.k24KurdishBold(22, Colors.black),
                      ),
                  ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                height: 100,
                width: 200,
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      orderController.deleteAllSubOrders();
                    });
                  },
                  child: Text(
                    'Place order',
                    style: FontConstants.k24KurdishLight(22, Colors.black),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(ColorConstants.pinkLight),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



