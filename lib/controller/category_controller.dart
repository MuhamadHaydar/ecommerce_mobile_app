import 'package:get/get.dart';

class CategoryController extends GetxController {

  RxInt selectedCategory = RxInt(0);

  void updateCategory(int categoryId){
    selectedCategory.value = categoryId;
  }


}