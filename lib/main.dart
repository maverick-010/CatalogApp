import 'package:flutter/material.dart';
import 'package:flutter_project/core/store.dart';
import 'package:flutter_project/pages/cart_page.dart';
import 'package:flutter_project/pages/home_page.dart';
import 'package:flutter_project/pages/login_page.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:flutter_project/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
//main method is entry point hai
void main(){
  runApp(VxState(
      store: MyStore(),
      child: MyApp())
  );
}
// function me pahla word small hoga dusra Capital hoga
//Method me Pahla word bhi capital hoga
// stl->> State Less Widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //build ke ander hi sara UI ka Kaam hota hai
  // flutter ke ander 90% cheeje widget hi return hoti hai
  // widget means component
  Widget build(BuildContext context) {
    // context --> jo hai wo btata hai kaun si cheej kaha par hai

    bringVegetables(thaila: true,rupees: 50);
    // Agar int and double me confuse ho rhe hai to "num" ka use karo wo dono leta hai
    // "var" compiler bta deta hai ki value int hai ya kya hai
    return MaterialApp(

      //home:HomePage(),
      themeMode: ThemeMode.system,
      // Light Theme ke liye
      theme:MyTheme.lightTheme(context),
      // dark Theme Ke liye
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,

      // Routes Kaise define hote hai
      // routes means hota hai rasta( bahut sare screen or bahut sare pages hai)
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/":(context)=>LoginPage(),
        MyRoutes.homeRoute:(context)=>HomePage(),
        MyRoutes.loginRoute:(context)=>LoginPage(),
        MyRoutes.cartRoute:(context)=>CartPage(),
      },
    );
  }
  // method -> kuch kaam hoga
  // {int rupees=100} --> optional parameter
bringVegetables({required bool thaila ,int rupees=100}){ //mai ruppes paisa de rha hu(kya de rhe ho aur kitna de rhe ho)
    //take cycle
  // go to market
}
}


// Stateless me screen par kuch change nhi hota puri screen change ho jati hai --> isme 1 class banti hai
//statefull me screen screen me hi kuch change ho jata hai --> isme 2 class banti hai
