import 'package:cloubite_app/auth/login_or_register.dart';
import 'package:cloubite_app/models/restaurant.dart';
import 'package:cloubite_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    //theme provider
    MultiProvider(providers: [
      //theme 
      ChangeNotifierProvider(create: (context) => ThemeProvider()),

      //menu
      ChangeNotifierProvider(create: (context) => Restaurant()),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
