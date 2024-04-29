import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/wish_list_provider.dart';
import 'package:food_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';

class WishList extends StatefulWidget {

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late WishListProvider wishListProvider;
  showAlertDialog(BuildContext context,ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text(" Do you want to delete the Product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    wishListProvider=Provider.of(context);
    wishListProvider.getWishListData();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "WishList",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body:ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context,index){
          ProductModel data= wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool:true,
                productId: data.productId,
                productImage:data.productImage,
                productName:data.productName,
                productPrice: data.productPrice,
                productQuantity: data.productQuantity,
                wishList: true,
                onDelete: (){
                  showAlertDialog(context,data);
                }, productUnit: "",
              ),
            ],
          );
        },
      ),
    );
  }
}


