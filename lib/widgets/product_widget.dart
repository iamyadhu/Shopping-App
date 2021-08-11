//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';

import '../providers/product.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';

//Models
import '../providers/product.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    print(cart.cartList.length);

    void addCart(){

      cart.addToCart(product);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailScreen.routeName,
                arguments: product);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Theme.of(context).primaryColorLight.withOpacity(0.7),
          leading: IconButton(
            icon: !product.isFavorite
                ? Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).accentColor,
                  )
                : Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
            onPressed: () => product.toggleFavorite(),
          ),
          title: Text(
            product.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Theme.of(context).accentColor,
            ),
            onPressed: addCart,
          ),
        ),
      ),
    );
  }
}
