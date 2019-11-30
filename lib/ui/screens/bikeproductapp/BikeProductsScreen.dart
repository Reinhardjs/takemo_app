import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/model/Product.dart';
import 'package:takemo_app/ui/widgets/ProductBox.dart';

import 'ProductDetailScreen.dart';

class BikeProductsScreen extends StatelessWidget {
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Beli motor")),
        body: Container(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ProductBox(item: items[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(item: items[index]),
                        ),
                      );
                    },
                  );
                })));
  }
}
