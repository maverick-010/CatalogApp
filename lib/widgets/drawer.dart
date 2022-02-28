import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl ="https://codersera.com/blog/wp-content/uploads/2019/07/BLOG-23-L-3.jpg";
    return Drawer(

      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

    padding: EdgeInsets.zero,


                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  accountName:Text("Mohd",style: TextStyle(
                    color: Colors.white
                  ),) ,
                accountEmail: Text("ua1411978@gmail.com",style: TextStyle(
                  color: Colors.white
                ),),

                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              title: Text(

                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                color: Colors.white
              ),),
            ),

            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
              title: Text(

                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),),
            ),

            ListTile(
              leading: Icon(CupertinoIcons.mail,color: Colors.white,),
              title: Text(

                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),),
            )

          ],
        ),
      ),
    );
  }
}
