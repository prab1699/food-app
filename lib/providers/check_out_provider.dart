

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/models/delivery_address_model.dart';
import 'package:location/location.dart';

class CheckoutProvider with ChangeNotifier {
  bool isloading=false;


  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternateMobileNo = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  LocationData setLocation = LocationData.fromMap({'latitude': null, 'longitude': null});


  void validator(context,myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "firstname is empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "lastname is empty");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "mobile no is empty");
    } else if (alternateMobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "alternate mobile no is empty");
    } else if (houseNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "house no is empty");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "area is empty");
    } else if (landmark.text.isEmpty) {
      Fluttertoast.showToast(msg: "landmark is empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "city is empty");
    } else if (state.text.isEmpty) {
      Fluttertoast.showToast(msg: "state is empty");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "pincode is empty");
    }else if (setLocation.latitude == null || setLocation.longitude == null) {
      Fluttertoast.showToast(msg: "setLocation is empty");
    }
    else {
      isloading=true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "firstname": firstName.text,
        "lastname": lastName.text,
        "mobileNo": mobileNo.text,
        "alternateMobileNo": alternateMobileNo.text,
        "houseNo": houseNo.text,
        "area": area.text,
        "landmark": landmark.text,
        "city": city.text,
        "state": state.text,
        "pincode": pincode.text,
        "addressType":myType.toString(),
        "longitude":setLocation.longitude,
        "latitude":setLocation.latitude,

      }).then((value) async {
        isloading=false;
        notifyListeners();
        await  Fluttertoast.showToast(msg: "Delivery Address Added");
               Navigator.of(context).pop();
                notifyListeners();

      });
      notifyListeners();
    }
  }
   List<DeliveryAddressModel> deliveryAddressList=[];
   getDeliveryAddressData() async {
     List<DeliveryAddressModel> newList=[];

      DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if(_db.exists){
      deliveryAddressModel=DeliveryAddressModel(
          firstName: _db.get("firstname"),
          lastName: _db.get("lastname"),
          mobileNo:_db.get("mobileNo"),
          alternateMobileNo:_db.get("alternateMobileNo"),
          houseNo: _db.get("houseNo"),
          area: _db.get("area"),
          landMark: _db.get("landmark"),
          city: _db.get("city"),
          state: _db.get("state"),
          pincode: _db.get("pincode"),
          addressType: _db.get("addressType"),
      );
      newList.add( deliveryAddressModel);
      notifyListeners();
    }
     deliveryAddressList= newList;
    notifyListeners();

  }

List<DeliveryAddressModel> get getDeliveryAddressList{
     return deliveryAddressList;
}


}
