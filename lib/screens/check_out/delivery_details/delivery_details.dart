import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:food_app/screens/check_out/delivery_details/single_delivery_item.dart';

class DeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:primaryColor,
        title: Text("Delivery Details"),),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      bottomNavigationBar: Container(
       // width: 160,
        height:48 ,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: MaterialButton(
          child: Text("Add New Address"),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddDeliveryAddress(),
            ),
            );
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        )
      ),
      body: ListView(
        children: [
        ListTile(
          title: Text("Deliver To"),
          leading: Image.asset("assets/location.png",
          height: 27,
            ),
        ),
          Divider(
            height:1,
          ),
          Column(
            children: [
                SingleDeliveryItem(
                  address:"Prabhjot,Area-Delhi,India,Street-22,Pincode-110009",
                  title: "Developer",
                  number: "+919212176565",
                  addressType: "Home",

                ),
            ],
          )
      ],),
    );
  }
}
