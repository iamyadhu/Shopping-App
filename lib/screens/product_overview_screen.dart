//Packages
import 'package:flutter/material.dart';
import '../widgets/productGrid.dart';

//Widgets
import '../widgets/product_widget.dart';

//Models
import '../providers/product.dart';

enum Filters {
  Favorites,
  All,
}

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MahTrends'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if(value == Filters.Favorites) isFav = true;
                else isFav = false;
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: Filters.Favorites,
              ),
              PopupMenuItem(
                child: Text('All Items'),
                value: Filters.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ProductGrid(isFav),
    );
  }
}
