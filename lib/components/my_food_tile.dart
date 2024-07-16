import 'package:cloubite_app/models/food.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget{
  final Food food;
  final void Function()? onTap;

  FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
            children: [

              //food text
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(food.name),
                Text('Rs. ${food.price}', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                Text(food.description),
              ],
              ),
              ),
              Image.asset(food.imagePath, height: 120, width: 120,),
            ],
          ),),
        )
      ],
    );
  }
}