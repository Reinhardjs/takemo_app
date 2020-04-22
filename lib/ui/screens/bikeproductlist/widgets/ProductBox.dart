import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/model/entities/Product.dart';

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.item}) : super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: Column(children: <Widget>[
        // Image(image: AssetImage("assets/bike_icon.png"), width: 85, height: 85),
        AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: Image.network(item.imageUrl, fit: BoxFit.fitHeight)),
        Expanded(
            child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.item.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.item.description),
                    Text("Price: " + this.item.price.toString()),
                  ],
                )))
      ]),
    ));
  }
}
