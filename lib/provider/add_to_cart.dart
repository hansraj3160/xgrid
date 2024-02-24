import 'package:flutter/foundation.dart';
import 'package:xgrid_test/model/products_model.dart';

 

class CartProvide extends ChangeNotifier{
  
  List<Products> products=[];
   List<int> productQuantity = [];
   addProduct({Products? product, int count=1}){
    
      if (products.contains(product)) {
      int index = products.indexOf(product!);
      productQuantity[index] = count;
    } else {
      products.add(product!);
      productQuantity.add(count);
    }

   notifyListeners();
  }

   bool hasProduct(Products? productDetails) {
    if (products.contains(productDetails)) {
      return true;
    } else {
      return false;
    }
  }

  int getProductCount({Products? productDetails}) {
    if (products.contains(productDetails)) {
      int index = products.indexOf(productDetails!);
      return productQuantity[index];
    } else {
      return 0;
    }
  }
int getAllItemsCount() {
    if (productQuantity.isNotEmpty) {
      int totalCount = 0;
      for (int i = 0; i < productQuantity.length; i++) {
        totalCount += productQuantity[i];
      }
      return totalCount;
    } else {
      return 0;
    }
  }
    removeProductFromCart({Products? productDetails}) {
    if (products.contains(productDetails)) {
      int index = products.indexOf(productDetails!);
      products.removeAt(index);
      productQuantity.removeAt(index);
    }
     
    // beforetipAdded();
    notifyListeners();
 
  }
    clearCart() {
    
    products.clear();
    productQuantity.clear();
    
    notifyListeners();
  }


}