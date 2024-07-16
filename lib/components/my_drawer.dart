import 'package:cloubite_app/components/my_drawer_tile.dart';
import 'package:cloubite_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 175, 221, 236),
      child: Column(
        children: [
          //app logo
          const Padding(
             padding: EdgeInsets.only(top: 100.0),
          child: Icon(
            Icons.cloud_outlined,
            size: 60,
          ),
      ) ,
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list
          MyDrawerTile(text: "HOME", icon: Icons.home, onTap: () => Navigator.pop(context)),
          MyDrawerTile(text: "SETTINGS", icon: Icons.settings_outlined, onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
          }),

          const Spacer(),
          MyDrawerTile(text: "LOG OUT", icon: Icons.logout_outlined, onTap: (){}),

          const SizedBox(height: 25),

          //settings


          //logout
        ],
      ),
    );
  }
}