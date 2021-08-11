import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    //Getting whole product as argument
    final product = ModalRoute.of(context).settings.arguments as Product;

    //Getting only productId
    //final productId = ModalRoute.of(context).settings.arguments as String;

    //Getting the product from provider using productID
    //We just need the data once, even if the products list is changed in Provider, this widget wont be changed
    //So we don't want this to listen for any changes... So we set listen to false
    final productProvider = Provider.of<Products>(context, listen: false)
        .getProduct(product.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(productProvider.name),
      ),
    );
  }
}
