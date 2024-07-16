import 'package:flutter/material.dart';
import 'package:cloubite_app/components/my_button.dart';
import 'package:cloubite_app/components/my_textfield.dart';


class RegisterPage extends StatefulWidget{
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                "Create an Account",
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

              MyTextField(controller: confirmPasswordController, hintText: "Verify Password", obscureText: true),

              const SizedBox(height: 20),

              //sign in button
              MyButton(text: "Sign Up", onTap: () {}),

              //already have an account
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an Account?', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Login!',
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