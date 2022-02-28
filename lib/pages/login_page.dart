import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton=false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(

          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png",fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Welcome $name",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,

              ),

              ),
              SizedBox(
                height: 20.0,
              ),

           Padding(
             padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
             child: Column(children: [
               TextFormField(
                 decoration: InputDecoration(
                   hintText: "Enter Username",
                   labelText: "Username",
                 ),
                 validator: (value){
                   if(value==null||value.isEmpty){
                     return "Username can not be empty";
                   }

                   return null;
                 },
                 onChanged: (value){
                   name=value;
                   setState(() {

                   });
                 },
               ),
               TextFormField(
                 obscureText: true,//dikhna chahiye ya nhi dikhna chahiye
                 decoration: InputDecoration(
                   hintText: "Enter Password",
                   labelText: "Password",
                 ),
                 validator: (value){
                   if(value==null||value.isEmpty){

                     return "Password can not be empty";
                   }

                   return null;

                 },
               ),
               SizedBox(
                 height: 40.0,
               ),

               // Animation Button
                Material(
                  color: context.theme.buttonColor,
                  borderRadius: BorderRadius.circular(changeButton?50:8),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton?50: 120,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton?Icon(Icons.done,
                      color: Colors.white,):Text("Login",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                      ),

                    ),
                  ),
                ),
               // ElevatedButton(
               //     child: Text("Login"),
               //
               //   style:TextButton.styleFrom(minimumSize: Size(150,40)),
               //   onPressed: (){
               //       Navigator.pushNamed(context, MyRoutes.homeRoute);
               //   }
               // )


             ],),
           ),



            ],
          ),
        ),
      ),
      // child: Center(
      //   child: Text("Login page",style: TextStyle(
      //     color: Colors.blue,
      //     fontWeight: FontWeight.bold
      //   ),
      //   ),
      // ),
    );
  }
}
