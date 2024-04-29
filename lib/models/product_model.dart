class ProductModel{
  String productName;
  String productImage;
  int    productPrice;
  String productId;
  int productQuantity;
  var productUnit;
  ProductModel({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
  required this.productUnit});
}

