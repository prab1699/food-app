import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import '../../../config/colors.dart';
import '../../../config/payment_config.dart';

class MyGooglePay extends StatefulWidget {
  final  total;

  MyGooglePay({required this.total});

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  void onGooglePayResult(paymentResult) {
    print(paymentResult);
    // Send the resulting Google Pay token to your server or PSP
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Payment Methods'),
      ),
      body: Center(
        child: GooglePayButton(
          paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
          paymentItems: [
            PaymentItem(
              label: 'Total',
              amount: '${widget.total}',
              status: PaymentItemStatus.final_price,
            )
          ],
          type: GooglePayButtonType.pay,
          margin: EdgeInsets.all(20), // Adjust margin as needed
          onPaymentResult: onGooglePayResult,
          loadingIndicator: CircularProgressIndicator(), // Show loading indicator while processing payment
        ),
      ),
    );
  }
}