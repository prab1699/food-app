import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/check_out_provider.dart';
import 'package:food_app/screens/check_out/google_map/google_map.dart';
import 'package:provider/provider.dart';

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

    CheckoutProvider checkoutProvider= Provider.of(context);
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
        child:checkoutProvider.isloading==false? MaterialButton(
          onPressed: () {
            checkoutProvider.validator(context,myType);
          },
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
        ):Center(
          child: CircularProgressIndicator(),
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
             keyboardType: TextInputType.text, controller: checkoutProvider.firstName,

            ),
            CustomTextField(
              labText: "Last Name",
                keyboardType: TextInputType.text,
              controller: checkoutProvider.lastName,
            ),
            CustomTextField(
              labText: "Mobile No",
              keyboardType: TextInputType.text,
              controller: checkoutProvider.mobileNo,

            ),
            CustomTextField(
              labText: "Alternate Mobile No",
              keyboardType: TextInputType.text,
              controller: checkoutProvider.alternateMobileNo,

            ),
            CustomTextField(
              labText: "House No",
              keyboardType: TextInputType.text,
              controller:checkoutProvider.houseNo,

            ),
            CustomTextField(
              labText: "Area",
              keyboardType: TextInputType.text,
              controller: checkoutProvider.area,

            ),
            CustomTextField(
              labText: "Landmark",
              keyboardType: TextInputType.text,
              controller: checkoutProvider.landmark,

            ),
            CustomTextField(
              labText: "City",
              keyboardType: TextInputType.text,
              controller: checkoutProvider.city,

            ),
            CustomTextField(
              labText: "State",
              keyboardType: TextInputType.text,
              controller: checkoutProvider.state,

            ),
            CustomTextField(
              labText: "Pincode",
              keyboardType: TextInputType.text,
              controller: checkoutProvider.pincode,

            ),
            InkWell(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute
                  ( builder: (context)=>CustomGoogleMap(),
                ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLocation.longitude == null && checkoutProvider.setLocation.latitude == null ? Text("Set Location") : Text("Done!"),
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
