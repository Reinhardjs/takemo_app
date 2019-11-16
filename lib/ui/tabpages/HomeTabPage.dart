import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/model/Product.dart';
import 'package:takemo_app/ui/pages/ProductPage.dart';
import 'package:takemo_app/ui/widgets/HomeAppBar.dart';
import 'package:takemo_app/ui/widgets/ProductBox.dart';

class HomeTabPage extends StatelessWidget {

  final items = Product.getProducts();

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: SafeArea(
            left: true,
            top: true,
            right: true,
            bottom: true,
            child: Column(
              children: <Widget>[
                HomeAppBar(
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: ProductBox(item: items[index]),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductPage(item: items[index]),
                                ),
                              );
                            },
                          );
                        })),
              ],
            )));
  }
}