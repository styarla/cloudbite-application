import 'package:cloubite_app/components/my_button.dart';
import 'package:cloubite_app/components/my_textfield.dart';
import 'package:cloubite_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login(){
    /*

    fill out authentication here
     */

    //navigate to home page
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //logo
            Icon(
            Icons.cloud_outlined,
            size: 90,
            color: Theme.of(context).colorScheme.primary
        ),
              const SizedBox(height: 25),

              //message, app slogan
              Text(
                "CloudBite",
                style: TextStyle(
                    fontSize: 80,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              const SizedBox(height: 25),

              //email
              MyTextField(controller: emailController, hintText: "Email Address", obscureText: false),

              const SizedBox(height: 10),
              //password
              MyTextField(controller: passwordController, hintText: "Password", obscureText: true),

              const SizedBox(height: 20),

              //sign in button
              MyButton(text: "Sign In", onTap: login),

              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a Member?', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text('Click Here to Register Now!',
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold,),
                  ),)
                ]
              )


        ]
        ),

    ),
    );
  }
}