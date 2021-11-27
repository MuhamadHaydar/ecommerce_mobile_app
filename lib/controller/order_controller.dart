import 'package:get/get.dart';
import 'package:restaurant_menu_app/models/category_item.dart';
import 'package:restaurant_menu_app/models/suborder.dart';

class OrderController extends GetxController {

  RxList<SubOrder> subOrders = RxList<SubOrder>([]);
  RxDouble totalSubOrdersCost = RxDouble(0);



  void addCategoryItemToSubOrders(ItemOfCategory itemOfCategory) {
    SubOrder subOrder = SubOrder(
        menu: itemOfCategory.title,
        category: itemOfCategory.category,
        quantity: 1,
        cost: itemOfCategory.price,
        totalCost: itemOfCategory.price,
        imageUrl: itemOfCategory.image,
        title: itemOfCategory.title
    );


    subOrders.add(subOrder);
    print("your list length is ${subOrders.length}");
    updateTotalSubOrdersCost();
    // make it false again to update the screen.

  }

  void deleteCategoryItemFromSubOrders(ItemOfCategory itemOfCategory){
    subOrders.removeWhere((currentSubOrder) => currentSubOrder.menu == itemOfCategory.title);
    updateTotalSubOrdersCost();
    print("your list length is ${subOrders.length}");
  }

  void deleteCategoryItemFromSubOrdersWithIndex(int index){
    subOrders.removeAt(index);
    updateTotalSubOrdersCost();
    print("your list length is ${subOrders.length}");
  }

  void updateQuantityOfIndexSubOrder({required int index, required int quantity, required totalCost}){
    subOrders.value[index].quantity= quantity;
    subOrders.value[index].totalCost = totalCost;
    updateTotalSubOrdersCost();
    notifyChildrens();
  }

  void updateTotalSubOrdersCost(){
    double currentTotalSubOrderCost = 0;
    // used to total all costs with current orders.
    subOrders.forEach((subOrder) {
      currentTotalSubOrderCost+= subOrder.cost * subOrder.quantity;
    });
    // update the value of suborders.
    totalSubOrdersCost.value = currentTotalSubOrderCost;
  }

  void deleteAllSubOrders(){
    // Used to delete all items from suborders list.
    subOrders.value = RxList<SubOrder>([]);
    totalSubOrdersCost.value = 0;
  }





}