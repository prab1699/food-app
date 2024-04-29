import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

import '../../../widgets/custom_text_field.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}
enum AddressTypes{
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType =AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: 160,
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Add Address",
            style: TextStyle(
              color: textColor,
            ),
          ),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
           CustomTextField(
             labText: "First Name",
             keyboardType: TextInputType.text, controller: null,

            ),
            CustomTextField(
              labText: "Last Name",
                keyboardType: TextInputType.text,
              controller: null,
            ),
            CustomTextField(
              labText: "Mobile No",
              keyboardType: TextInputType.text,
              controller: null,

            ),
            CustomTextField(
              labText: "Alternate Mobile No",
              keyboardType: TextInputType.text,
              controller: null,

            ),
            CustomTextField(
              labText: "House No",
              keyboardType: TextInputType.text,
              controller:null,

            ),
            CustomTextField(
              labText: "Area",
              keyboardType: TextInputType.text,
              controller: null,

            ),
            CustomTextField(
              labText: "Landmark",
              keyboardType: TextInputType.text,
              controller: null,

            ),
            CustomTextField(
              labText: "City",
              keyboardType: TextInputType.text,
              controller: null,

            ),
            CustomTextField(
              labText: "State",
              keyboardType: TextInputType.text,
              controller: null,

            ),
            CustomTextField(
              labText: "Pincode",
              keyboardType: TextInputType.text,
              controller: null,

            ),
            InkWell(
              onTap:(){},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set Location")
                  ],
                ),

              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type"),
            ),
            RadioListTile(
                value: AddressTypes.Home,
                groupValue: myType,
                title: Text("Home"),
                onChanged:(AddressTypes? value) {
                  if (value != null) {
                    setState(() {
                      myType = value;
                    });
                  }
                },
              secondary: Icon(Icons.home,color: primaryColor
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue:  myType,
              title: Text("Work"),
              onChanged:(AddressTypes? value) {
                if (value != null) {
                  setState(() {
                    myType = value;
                  });
                }
              },
              secondary: Icon(Icons.work,color: primaryColor
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue:  myType,
              title: Text("Other"),
              onChanged:(AddressTypes? value) {
                if (value != null) {
                  setState(() {
                    myType = value;
                  });
                }
              },
              secondary: Icon(Icons.devices_other,color: primaryColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
