import 'package:cloubite_app/components/my_button.dart';
import 'package:cloubite_app/components/my_cart_tile.dart';
import 'package:cloubite_app/models/restaurant.dart';
import 'package:cloubite_app/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      //cart
      final userCart= restaurant.cart;

      //scaffold UI
      return Scaffold(
        appBar: AppBar(title: const Text("Cart"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          //clear cart
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: (context) => AlertDialog(
                title: const Text("Are you sure you want to clear the cart?"),
                actions: [
                  //cancel
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),

                  //confirm
                  TextButton(onPressed: () => {Navigator.pop(context), restaurant.clearCart()}, child: Text("Confirm")),
                ],
              ), );
            },
            icon: const Icon(Icons.delete),
          )
        ],
        ),
        body: Column(
          children: [

            //list of cart
            Expanded(
              child: Column(
                children: [
                userCart.isEmpty ? const Expanded(child: Center(child: Text("Cart is Empty"),),): Expanded(
                  child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      //getting cart item name
                      final cartItem= userCart[index];
              
                      //returning item name Ui
                      return MyCartTile(cartItem: cartItem);
                      },
                    ),
                  ),
              ],),
            ),

            //button to pay
            MyButton(text: "Go to Checkout", onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()),),),

            const SizedBox(height: 25)
          ],
        ),
        );
    });
  }
}