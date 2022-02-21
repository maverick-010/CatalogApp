import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
// stl->> State Less Widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //build ke ander hi sara UI ka Kaam hota hai
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
              child: Text("Welcome Mohd Umar"),
    ),
        ),
      ),
    );
  }
}
