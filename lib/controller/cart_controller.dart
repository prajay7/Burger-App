import 'package:flutter/cupertino.dart';

class CartController extends ChangeNotifier{

  final List<CartItemInfo> cartItems = [
    CartItemInfo(image: "assets/images/big_pizza.png",name: "Pizza ai ... ",price:'N10500.95',quantity: 1),
    CartItemInfo(image: "assets/images/big_burger.png",name: "Beef Burger",price:'N2600.00',quantity: 1),
    CartItemInfo(image: "assets/images/burger_1.jpeg",name: "Beef Burger",price:'N2600.00',quantity: 1),
    CartItemInfo(image: "assets/images/pizza_1.png",name: "Beef Burger",price:'N2600.00',quantity: 1),
  ];

  ValueNotifier<int> quantity = ValueNotifier(0);

  void quantityIncrement(int index){
    cartItems[index].quantity++;
    quantity.notifyListeners();
  }

  void quantityDecrement(int index){
    if(cartItems[index].quantity == 1) return;
    cartItems[index].quantity--;
    quantity.notifyListeners();
  }
}

class CartItemInfo{
  final String image;
  final String name;
  final String price;
  int quantity;

  CartItemInfo({required this.image,required this.name,required this.price,required this.quantity});
}