import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/delivery_address_model.dart';
import 'package:food_app/providers/check_out_provider.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/screens/check_out/payment_summary/order_item.dart';
import 'package:provider/provider.dart';

import '../delivery_details/single_delivery_item.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAddressList;
  PaymentSummary({required this.deliveryAddressList});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    double discount=30;
    double discountValue = 0;
    double total;
    double shippingCharge = 30.0;
    double totalPrice=reviewCartProvider.getTotalPrice();
      if (totalPrice > 200) {
        discountValue = (totalPrice * discount) / 100;
        total = totalPrice - discountValue;
      } else {
        total = totalPrice; // Ensure total is always initialized
      } // Ensure total is always initialized


    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "₹${total+30??totalPrice}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {

            },
            child: Text(
              "Place Order",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SingleDeliveryItem(
                      address:
                          "HouseNo- ${widget.deliveryAddressList.houseNo}, Area- ${widget.deliveryAddressList.area},Landmark- ${widget.deliveryAddressList.landMark},City-${widget.deliveryAddressList.city},State- ${widget.deliveryAddressList.state},Pincode-${widget.deliveryAddressList.pincode}",
                      title:
                          "${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName}",
                      number: widget.deliveryAddressList.mobileNo,
                      addressType: widget.deliveryAddressList.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : widget.deliveryAddressList.addressType ==
                                  "AddressTypes.Home"
                              ? "Home"
                              : "Work"),
                  Divider(),
                  ExpansionTile(
                    children: reviewCartProvider.getReviewCartDataList.map((e) {
                      return OrderItem(e: e,);
                    }).toList(),
                    title: Text("Order Items ${reviewCartProvider.getReviewCartDataList.length}"),
                  ),
                  Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Sub Total",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "₹${totalPrice}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Shipping Charge",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Text(
                      "₹30",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "Applied Discount",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Text(
                      "₹${discountValue.toStringAsFixed(2)}", // Format discountValue to 2 decimal places",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text("Payment Options"),
                  ),
                  RadioListTile(
                    value: AddressTypes.Home,
                    groupValue: myType,
                    title: Text("Cash On Delivery"),
                    onChanged: (AddressTypes? value) {
                      if (value != null) {
                        setState(() {
                          myType = value;
                        });
                      }
                    },
                    secondary: Icon(Icons.money, color: primaryColor),
                  ),
                  RadioListTile(
                    value: AddressTypes.OnlinePayment,
                    groupValue: myType,
                    title: Text("Online Payment"),
                    onChanged: (AddressTypes? value) {
                      if (value != null) {
                        setState(() {
                          myType = value;
                        });
                      }
                    },
                    secondary: Icon(Icons.payment, color: primaryColor),
                  ),
                ],
              );
            },
          )),
    );
  }
}
