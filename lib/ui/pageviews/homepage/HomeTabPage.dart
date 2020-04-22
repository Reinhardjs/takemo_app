import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/bloc/AppBloc.dart';
import 'package:takemo_app/bloc/BlocProvider.dart';
import 'package:takemo_app/ui/pageviews/homepage/widgets/AppProductButton.dart';
import 'package:takemo_app/ui/pageviews/homepage/widgets/PromoWidget.dart';
import 'package:takemo_app/ui/screens/bikeproductlist/BestSellingProductListWidget.dart';
import 'package:takemo_app/ui/screens/bikeproductlist/BikeProductsScreen.dart';

class HomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 15),
            child: Text("TakeMo"),
          ),
          elevation: 0.0,
        ),
        body: BlocProvider(
            bloc: AppBloc.appBloc,
            child: SingleChildScrollView(
                child: SafeArea(
                    top: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        HomeAppBar(
//                          height: MediaQuery.of(context).size.height,
//                        ),
                        Container(
                            margin: EdgeInsets.only(top: 0),
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Dealers',
                                        style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: new Dealers()),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Promo',
                                        style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      PromoWidget(),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Produk Terlaris',
                                        style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Container(
                                          child:
                                              BestSellingProductListWidget()),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    )))));
  }
}

class Dealers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Dealers build");

    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(10),
        physics: const NeverScrollableScrollPhysics(),
        children: <Map<String, String>>[
          {
            "title": "Honda",
            "imageUrl":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTt0Nd9m04nRV4tc8qWgmShAkcSu_Dr44JtiaVyU4q6psCebWno",
            "padding": "9.0",
          },
          {
            "title": "Kawasaki",
            "imageUrl":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQVqumqT_YRN9RcEI3xjJotgr6bbbLb4WUCDZl3ILIHsRRPdmi4",
            "padding": "3.0",
          },
          {
            "title": "Suzuki",
            "imageUrl":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQebpJNJ1wbP2Z_K1TWfp2i6DyF-0SOOHOX7nLH9aGaBTsItjII",
            "padding": "1.0",
          },
          {
            "title": "Yamaha",
            "imageUrl":
                "https://i.pinimg.com/originals/19/2b/5c/192b5c7581f94bcb5134481c1f5c2ce7.jpg",
            "padding": "7.0",
          },
        ].map((Map<String, String> data) {
          return GridTile(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BikeProductsScreen(),
                      ),
                    );
                  },
                  child: DealerButton(
                      title: data["title"],
                      imageUrl: data["imageUrl"],
                      padding: double.parse(data["padding"]))));
        }).toList());
  }
}
