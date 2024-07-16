import 'package:cloubite_app/components/my_current_location.dart';
import 'package:cloubite_app/components/my_desciption_box.dart';
import 'package:cloubite_app/components/my_drawer.dart';
import 'package:cloubite_app/components/my_food_tile.dart';
import 'package:cloubite_app/components/my_sliver_app_bar.dart';
import 'package:cloubite_app/components/my_tab_bar.dart';
import 'package:cloubite_app/models/food.dart';
import 'package:cloubite_app/models/restaurant.dart';
import 'package:cloubite_app/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

//tab controller
late TabController _tabController;

@override
void initState(){
  super.initState();
  _tabController = TabController(length: FoodCategory.values.length, vsync: this);
}

@override 
void dispose(){
  _tabController.dispose();
  super.dispose();

}

//sort and return a list of food items that belong to a certain menu

List<Food> _filterMenuBycategory(FoodCategory category, List<Food> fullMenu) {
  return fullMenu.where((food) => food.category == category).toList();
}

//return list of foods
List<Widget> getFoodInThisCategory(List<Food> fullMenu){
  var list = FoodCategory.values.map((category) {
    List<Food> categoryMenu = _filterMenuBycategory(category, fullMenu);

    return ListView.builder(
      itemCount: categoryMenu.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final food = categoryMenu[index];

        return FoodTile(food: food, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: food),),),);
      }
    );
  }).toList();
  return list;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(indent: 50, endIndent: 50, color: Theme.of(context).colorScheme.secondary,),
                  //my current location
                  const MyCurrentLocation(),

                  //description box
                  const MyDescriptionBox(),


          ],),
          ),
        
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaraunt, child) => TabBarView(
          controller: _tabController,
          children: getFoodInThisCategory(restaraunt.menu),
        ),
        ),
      ),

    );
  }}