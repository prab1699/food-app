import 'package:flutter/material.dart';
import 'package:food_app/widgets/count.dart';

class SingleProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final GestureTapCallback? onTap;
  final String productId;
  SingleProduct(
      {  required this.productId,
        required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      productImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₹ $productPrice/50 Gram',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          '50 Gram',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                        Center(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: Color(0xffd0b84c),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Count(
                                productId: productId,
                                     productImage: productImage,
                                      productName: productName,
                                      productPrice: productPrice,

                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
