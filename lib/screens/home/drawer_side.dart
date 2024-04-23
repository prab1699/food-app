import 'package:flutter/material.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import 'package:food_app/screens/review_cart/review_cart.dart';





class DrawerSide extends StatefulWidget {
  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile(
      {required IconData icon,
        required String title,
        required Function onTap})
  {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: ListTile(

        leading: Icon(
          icon,
          size: 32,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black54),
        ),
      ),);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffcbcbcb),
      child: Container(
        color: Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white60,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(
                             "https://s3.envato.com/files/328957910/vegi_thumb.png"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome Guest"),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 25,
                          child: OutlinedButton(onPressed: (){},
                            child: Text("Login"),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(width: 2),
                            )
                          ),
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
                icon: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()),);
                }),
            listTile(
                icon: Icons.shop_outlined, title: "Review Cart", onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ReviewCart()),);
            }),
            listTile(
                icon: Icons.person_outlined,
                title: "My Profile",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyProfile(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.notifications_outlined,
                title: "Notification",
                onTap: () {}),
            listTile(
                icon: Icons.star_outlined,
                title: "Rating & Review",
                onTap: () {}),
            listTile(
                icon: Icons.favorite_outlined, title: "Wishlist", onTap: () {}),
            listTile(
                icon: Icons.copy_outlined,
                title: "Raise a Complaint",
                onTap: () {}),
            listTile(
                icon: Icons.format_quote_outlined, title: "FaQs", onTap: () {}),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+91 9212176565"),
                    ],
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Email us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("prab1671@gmail.com"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}