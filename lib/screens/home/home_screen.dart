import 'package:flutter/material.dart';
import 'package:food_app/providers/product_provider.dart';


import 'package:food_app/screens/home/drawer_side.dart';
import 'package:food_app/screens/home/single_product.dart';

import '../../config/colors.dart';

import '../../providers/user_provider.dart';
import '../product_overview/product_overview.dart';
import '../review_cart/review_cart.dart';
import '../search/search.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  Widget buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Herbs Seasonings'),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search(
                    search:  productProvider.getHerbsProductDataList,
                  ),),);
                },
              child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHerbsProductDataList.map(
              (herbsProductData) {
                return SingleProduct(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProductOverview(
                                  productPrice: herbsProductData.productPrice,
                                  productName: herbsProductData.productName,
                                  productImage: herbsProductData.productImage,
                                  productId: herbsProductData.productId,
                                )),
                      );
                    },
                    productId: herbsProductData.productId,
                    productPrice: herbsProductData.productPrice,
                    productImage: herbsProductData.productImage,
                    productName: herbsProductData.productName,
                    productUnit: herbsProductData);
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fresh Fruits'),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search(
                search:  productProvider.getFreshProductDataList,
              ),),);
            },
            child: Text(
              'view all',
              style: TextStyle(color: Colors.grey),
            ),),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFreshProductDataList.map(
              (freshProductData) {
                return SingleProduct(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProductOverview(
                                  productPrice: freshProductData.productPrice,
                                  productName: freshProductData.productName,
                                  productImage: freshProductData.productImage,
                              productId: freshProductData.productId,
                                )),
                      );
                    },
                    productId: freshProductData.productId,
                    productPrice: freshProductData.productPrice,
                    productImage: freshProductData.productImage,
                    productName: freshProductData.productName,
                    productUnit: freshProductData,);
              },
            ).toList(),
          ),
        )
      ],
    );
  }

  Widget buildRootProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fresh Roots'),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Search(
                    search:  productProvider.getRootProductDataList,
                  ),),);
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getRootProductDataList.map(
              (rootProductData) {
                return SingleProduct(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProductOverview(
                                  productPrice: rootProductData.productPrice,
                                  productName: rootProductData.productName,
                                  productImage: rootProductData.productImage,
                                   productId: rootProductData.productId,

                                )),
                      );
                    },
                    productId: rootProductData.productId,
                    productPrice: rootProductData.productPrice,
                    productImage: rootProductData.productImage,
                    productName: rootProductData.productName,
                    productUnit: rootProductData,);
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProductData();
    productProvider.fetchFreshProductData();
    productProvider.fetchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider= Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: textColor),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0Xffd6d382),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(search: productProvider.getAllProductSearch,),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: textColor,
              ),
            ),
          ),
          Padding
            (padding: EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReviewCart(),
                ),
              );
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0Xffd6d382),
              child: Icon(
                Icons.shop,
                size: 17,
                color: textColor,
              ),
            ),
          ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.thermofisher.com/blog/food/wp-content/uploads/sites/5/2021/10/istock-857145602_fruitvegs-3.jpg'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 130, bottom: 10),
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0Xffd1ad17),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Vegi',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.green,
                                              blurRadius: 10,
                                              offset: Offset(3, 3)),
                                        ]),
                                  ),
                                ),
                              )),
                          Text(
                            '30% OFF',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'On all vegetables products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            buildHerbsProduct(context),
            buildFreshProduct(context),
            buildRootProduct(context),
          ],
        ),
      ),
    );
  }
}
