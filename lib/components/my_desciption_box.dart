// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget{
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context){

    //text style
    var MyPrimaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.inversePrimary,);
    var MySecondaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.primary,);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text("Rs. 1999", style: MyPrimaryTextStyle,),
              Text("Delivery Fee", style: MySecondaryTextStyle,),
            ],
          ),

          //delivery time
          Column(
            children: [
              Text("45 Minutes", style: MyPrimaryTextStyle,),
              Text("Delivery Time", style: MySecondaryTextStyle,),
            ],
          ),
        ],
      ),
    );
  }
}