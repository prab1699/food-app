import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/screens/product_overview/product_overview.dart';
import 'package:food_app/widgets/single_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel>search;
  Search({required this.search});

  @override
  State<Search> createState() => _SearchState();
}
String query="";

class _SearchState extends State<Search> {

  searchItem(String query){
    List<ProductModel> searchFood =widget.search.where((element){
     return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }
  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem= searchItem(query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 10,
          ),
          Column(
            children: _searchItem.map((data){
              return SingleItem(
                isBool:false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity:1,
                  onDelete:(){}, wishList: false, productUnit: null, );
               }) .toList(),
           ),


        ],
      ),
    );
  }
}
