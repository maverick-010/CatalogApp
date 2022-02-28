import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/core/store.dart';
import 'package:flutter_project/models/cart.dart';
import 'dart:convert';
import 'package:flutter_project/models/catalog.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:flutter_project/widgets/home_widgets/catalog_list.dart';

import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final url="";

  @override
  void initState() {

    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(Duration(seconds: 2));
   final catalogJson= await rootBundle.loadString("assets/files/catalog.json");
   final decodedData=jsonDecode( catalogJson);
   var productData =decodedData["products"];
   CatalogModel.items= List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
   setState(() {

   });
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // const int days=30;
    // const String  name="Mohd Umar Ansari";
   // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(context,_)=> FloatingActionButton(onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart,color: Colors.white,),).badge(color: Vx.red500,size: 22,count: _cart.items.length,
        textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        )),
      ),
      body:SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      )
    );
  }
}







