import 'package:cloubite_app/components/my_quantity_selector.dart';
import 'package:cloubite_app/models/cart_items.dart';
import 'package:cloubite_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget{
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context){
    return Consumer<Restaurant>(builder: (context, restaurant, child) => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                  //food image
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 100,
                    width: 100,
              ),),
            
              const SizedBox(width: 10,),
                
                  //name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    //food name
                    Text(cartItem.food.name),
            
                    //food price
                    Text('Rs.${cartItem.food.price}'),
            
                  ],),

                  const Spacer(),
                
                  //increment or decrement
                  QuantitySelector(
                    quantity: cartItem.quantity, 
                    food: cartItem.food, 
                    onIncrement: () {
                      restaurant.addToCart(cartItem.food, cartItem.selectedAddOns);
                    }, 
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    }),
                ],
              ),
          ),
          SizedBox(
            height: cartItem.selectedAddOns.isEmpty ? 0 : 60,
            child: ListView(
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              scrollDirection: Axis.horizontal,
              children: cartItem.selectedAddOns.map((addon) => 
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                label: Row(
                  children: [
                    //addon name
                    Text(addon.name),

                    //addon price
                    Text('Rs.${addon.price}'),
                  ],
                ),
                shape: StadiumBorder(side: BorderSide(color: Theme.of(context).colorScheme.primary)), 
                onSelected: (value) {},
                backgroundColor: Theme.of(context).colorScheme.secondary,
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 12),
                ),),
                ).toList(),
            ),
            ),
          ],),

        ),);
  }
}