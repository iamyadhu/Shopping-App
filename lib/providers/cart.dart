import 'package:flutter/foundation.dart';
import './product.dart';

class CartItem {
  final Product product;
  int quantity;
  final String id;

  CartItem({
    @required this.product,
    @required this.quantity,
    @required this.id,
  });
}

class Cart with ChangeNotifier {
    List<CartItem> cartList = [];

  List<CartItem> get getCartItems {
    return [...cartList];
    notifyListeners();
  }
  
  void addToCart(Product prod){

    if(cartList.isEmpty) cartList.add(CartItem(product: prod, quantity: 1, id: DateTime.now().toString(),));

    else {
      CartItem existingItem = cartList.firstWhere((element) => element.product == prod, orElse: () => null);

      if (existingItem != null)
        existingItem.quantity += 1;
      else
        cartList.add(CartItem(
          product: prod, quantity: 1, id: DateTime.now().toString(),));
    }
    notifyListeners();
  }
}
