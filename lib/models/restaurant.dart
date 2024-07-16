// ignore_for_file: unnecessary_string_escapes

import 'package:cloubite_app/models/cart_items.dart';
import 'package:cloubite_app/models/food.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{

//food menu
final List<Food> _menu =[
  //biryani
  Food(
    name: "Chicken Biryani", 
    description: "Delicious marinated Chicken with Fragrant Basmati Rice", 
    imagePath: "lib/images/biryani/chicken biryani.jpeg", 
    price: 349, 
    category: FoodCategory.biryanis, 
    availableAddOns: [AddOn(name: "Raita", price: 20)]),

  Food(
    name: "Mutton Biryani", 
    description: "Delicious marinated Mutton with Fragrant Basmati Rice", 
    imagePath: "lib/images/biryani/mutton biryani.jpeg",
    price: 359, 
    category: FoodCategory.biryanis, 
    availableAddOns: [AddOn(name: "Raita", price: 20)]),

  Food(
    name: "Vegetarian Biryani", 
    description: "Deliciously cooked Vegetables with Fragrant Basmati Rice", 
    imagePath: "lib/images/biryani/veg biryani.jpeg", 
    price: 309, 
    category: FoodCategory.biryanis, 
    availableAddOns: [AddOn(name: "Raita", price: 20)]),

    Food(
    name: "Egg Biryani", 
    description: "Deliciously cooked Eggs with Fragrant Basmati Rice", 
    imagePath: "lib/images/biryani/egg biryani.jpeg", 
    price: 319, 
    category: FoodCategory.biryanis, 
    availableAddOns: [AddOn(name: "Raita", price: 20)]),

  //sides
    Food(
    name: "Gobi Manchurian", 
    description: "Cauliflower chopped up and cooked in an aromatic and tangy sauce", 
    imagePath: "lib/images/sides/gobi manchurian.jpeg", 
    price: 249, 
    category: FoodCategory.sides, 
    availableAddOns: [AddOn(name: "Sauce", price: 15)]),

    Food(
    name: "Crispy Corn", 
    description: "Corn Kernels deep friend in oil and tossed in spices and aromatics, served with lemon and onions", 
    imagePath: "lib/images/sides/crispy corn.jpeg", 
    price: 249, 
    category: FoodCategory.sides, 
    availableAddOns: [AddOn(name: "Sauce", price: 15)]),

    Food(
    name: "Gobi Manchurian", 
    description: "Cottage cheese chopped up and cooked in an aromatic and tangy sauce", 
    imagePath: "lib/images/sides/paneer chilli.jpeg", 
    price: 249, 
    category: FoodCategory.sides, 
    availableAddOns: [AddOn(name: "Sauce", price: 15)]),

  //kebabs
  Food(
    name: "Chicken Donner", 
    description: "Chicken marinated and grilled over a tandoori, served with lemon and spiced onions", 
    imagePath: "lib/images/kebabs/chicken donner.jpeg", 
    price: 300, 
    category: FoodCategory.kebabs, 
    availableAddOns: [AddOn(name: "Green Sauce", price: 15)]),

    Food(
    name: "Seekh Kebab", 
    description: "Minced Mutton shaped into a kebab and grilled over a tandoori, served with lemon and spiced onions", 
    imagePath: "lib/images/kebabs/seekh kebab.jpeg", 
    price: 300, 
    category: FoodCategory.kebabs, 
    availableAddOns: [AddOn(name: "Green Sauce", price: 15)]),

  Food(
    name: "Hara Bhara Kebab", 
    description: "Peas, potatos and spices minced together into a patty shape and deep fried in oil", 
    imagePath: "lib/images/kebabs/hara bhara kebab.jpeg", 
    price: 300, 
    category: FoodCategory.kebabs, 
    availableAddOns: [AddOn(name: "Green Sauce", price: 15)]),

  //drinks
  Food(
    name: "Water Bottle", 
    description: "250 ml Bottle of Water", 
    imagePath: "lib/images/drinks/water bottle.jpeg", 
    price: 60, 
    category: FoodCategory.drinks, 
    availableAddOns: []),

  Food(
    name: "Coco Cola", 
    description: "250 ml of Coke", 
    imagePath: "lib/images/drinks/coco cola.jpeg", 
    price: 60, 
    category: FoodCategory.drinks, 
    availableAddOns: []),
    
  Food(
    name: "Sprite", 
    description: "250 ml of Sprite", 
    imagePath: "lib/images/drinks/sprite.jpeg", 
    price: 60, 
    category: FoodCategory.drinks, 
    availableAddOns: []),

  Food(
    name: "Fanta", 
    description: "250 ml of Fanta", 
    imagePath: "lib/images/drinks/fanta.jpeg", 
    price: 60, 
    category: FoodCategory.drinks, 
    availableAddOns: []),

  //desserts
  Food(
    name: "Apricot Delight", 
    description: "a Slice of Vanilla Sponge Cake doused in whole cream and apricot jam", 
    imagePath: "lib/images/desserts/apricot delight.jpeg", 
    price: 100, 
    category: FoodCategory.desserts, 
    availableAddOns: []),

  Food(
    name: "Gulab Jamun", 
    description: "Deep Fried Dough Balls soaked in rosewater sugar syrup", 
    imagePath: "lib/images/desserts/gulab jamun.jpeg", 
    price: 100, 
    category: FoodCategory.desserts, 
    availableAddOns: []),

  Food(
    name: "Ice Cream", 
    description: "Choose from the Ice Cream of your Choice", 
    imagePath: "lib/images/desserts/vanilla ice cream.jpeg", 
    price: 90, 
    category: FoodCategory.desserts, 
    availableAddOns: [
      AddOn(name: "Chocolate", price: 0), 
      AddOn(name: "Vanilla", price: 0),
      AddOn(name: "Strawberry", price: 0)])
];


/*


getters

*/

List<Food> get menu => _menu;
List<CartItem> get cart => _cart;




//operations

//cart
final List<CartItem> _cart = [];

//add to cart
void addToCart (Food food, List<AddOn> selectedAddOns){
  //see if there is a cart item
  CartItem? cartItem = _cart.firstWhereOrNull((item) {
    //checking
    bool isSameFood = item.food == food;

    //checking addons
    bool isSameAddOns= ListEquality().equals(item.selectedAddOns, selectedAddOns);

    return isSameAddOns && isSameFood;
  }); 
  if (cartItem != null){
    cartItem.quantity++;
  }

  //otherwise
  else{
    _cart.add(CartItem(food: food, selectedAddOns: selectedAddOns));
  }
  notifyListeners();
}

//remove from cart
void removeFromCart(CartItem cartItem){
  int cartIndex= _cart.indexOf(cartItem);
  
  if (cartIndex != -1){
    if (_cart[cartIndex].quantity > 1){
      _cart[cartIndex].quantity--;
    }else{
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}

//get total price
double getTotalPrice (){
  double total = 0.0;

  for (CartItem cartItem in _cart){
    double itemTotal= cartItem.food.price;
    for (AddOn addOn in cartItem.selectedAddOns){
      itemTotal+= addOn.price;
    }
    total+= itemTotal * cartItem.quantity;
  }
  return total;
}

//get total numer of items
int getTotalItemCount() {
  int totalItemCount= 0;

  for (CartItem cartItem in _cart){
    totalItemCount+=cartItem.quantity;
  }
  return totalItemCount;

}

//clear cart
void clearCart(){
  _cart.clear();
  notifyListeners();
}



/*

helpers

*/
//generating a receipt
//String generateCartReceipt(){
  //final receipt= StringBuffer();
  //receipt.writeln("Here's your Receipt!");
  //receipt.writeln();

  //date
  //String formattedDate= DateFormat("yyyy-mm-dd hh:mm:ss").format();
}

//format double value into money
String _formatPrice(double price){
  return "Rs.${price.toStringAsFixed(2)}";
}

//format list of addons into a string memory
String _formatAddons(List<AddOn> addon){
  return addon.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
}



