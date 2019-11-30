import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/bloc/AppBloc.dart';
import 'package:takemo_app/bloc/BlocProvider.dart';
import 'package:takemo_app/model/Product.dart';
import 'package:takemo_app/ui/screens/bikeproductlist/ProductListWidget.dart';

class BikeProductsScreen extends StatelessWidget {
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Beli motor")),
        body: Container(
            child: BlocProvider(bloc: appBloc, child: ProductListWidget())));
  }
}
