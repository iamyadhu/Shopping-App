import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import '../providers/product.dart';

import './product_widget.dart';
import '../providers/product_provider.dart';

class ProductGrid extends StatelessWidget {
  final bool isFav;

  ProductGrid(this.isFav);

  @override
  Widget build(BuildContext context) {
    //Creating an instance of Product(provider) object
    final productObj = Provider.of<Products>(context);

    //After creating the instance of object, we access the getter method and fetch products data (just like in Java)
    final products = isFav==true ? productObj.favorites : productObj.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //Here we need to use the 'value' way of constructing because when there is a listView or gridView,
        //Flutter builds only the items which are on the screen.. So, there will issues with builder method
        //of ChangeNotifierProvider

          value: products[i],
          child: ProductWidget(),
        ),
    );
  }
}
