
import 'package:cloubite_app/models/food.dart';


class CartItem{
  Food food;
  List<AddOn> selectedAddOns;
  int quantity;

  CartItem({required this.food, required this.selectedAddOns,this.quantity=1});

  double get totalPrice{
    double addonPrice = selectedAddOns.fold(0, (sum, AddOn) => sum+AddOn.price);

    return (food.price + addonPrice)*quantity;
  }
}