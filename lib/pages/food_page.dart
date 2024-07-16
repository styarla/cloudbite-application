import 'package:cloubite_app/components/my_button.dart';
import 'package:cloubite_app/models/food.dart';
import 'package:cloubite_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FoodPage extends StatefulWidget{
  final Map<AddOn, bool> selectedAddOns = {};
  final Food food;
  FoodPage({super.key, required this.food}){
    //initialize selected addons to false
    for (AddOn addon in food.availableAddOns){
      selectedAddOns[addon]=false;
    }
}
  

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food, Map<AddOn, bool> selectedAddOns){
    //closing food page
    Navigator.pop(context);

    List<AddOn> currentlySelectedAddOns= [];

    //format the selected addons
    for (AddOn addon in widget.food.availableAddOns){
      if (widget.selectedAddOns[addon] == true){
        currentlySelectedAddOns.add(addon);
        for (AddOn addon in widget.food.availableAddOns){
          if (widget.selectedAddOns[addon] == true){
            currentlySelectedAddOns.add(addon);
          }
        }
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddOns);
  }
  @override
  Widget build(BuildContext context){
    return Stack(children: [
      //scaffold
      Scaffold(
      body: Column(
      children: [

        const SizedBox(height: 15),
        //image 
        Image.asset(widget.food.imagePath,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          //food name
        Text(widget.food.name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),

        const SizedBox(height: 10),

        //food description
        Text(widget.food.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),

        //food price
        Text('Rs. ${widget.food.price}', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),


        //addons
        ListView.builder(
          itemCount: widget.food.availableAddOns.length,
          itemBuilder: (context, index) {
            AddOn addOn =widget.food.availableAddOns[index];

            return CheckboxListTile(
              title: Text(addOn.name), 
              subtitle: Text('Rs. '+addOn.price.toString()),
              value: widget.selectedAddOns[addOn],
               onChanged: (bool? value) {
                setState(() {
                  widget.selectedAddOns[addOn]= value!;
                });
               });
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        )],),
        MyButton(text: "add to cart" , onTap: () => addToCart(widget.food, widget.selectedAddOns)),

      ],
      ),
    ),
    //back button
    const SizedBox(height: 50),
    SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, 
        shape: BoxShape.circle, ),
      child: IconButton(icon: Icon(Icons.arrow_back_ios_rounded),
      onPressed: () => Navigator.pop(context),)
    ),),

    ],);
  }


}