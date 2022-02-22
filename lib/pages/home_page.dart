import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int days=30;
    const String  name="Mohd Umar Ansari";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          //$ is access to variable -- ek word hai to $ and bahut sare hai to ${ }
          child: Text("Welcome $days Mohd Umar by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
