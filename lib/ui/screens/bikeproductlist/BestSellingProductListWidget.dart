import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/bloc/AppBloc.dart';
import 'package:takemo_app/bloc/BlocProvider.dart';
import 'package:takemo_app/bloc/ProductBloc.dart';
import 'package:takemo_app/model/entities/Product.dart';
import 'package:takemo_app/model/responses/ProductListResponse.dart';
import 'package:takemo_app/ui/screens/bikeproductlist/widgets/ProductBox.dart';

import '../bikeproductdetail/ProductDetailScreen.dart';

class BestSellingProductListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BestSellingProductListWidgetState();
  }
}

class _BestSellingProductListWidgetState extends State<BestSellingProductListWidget> {

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context).bloc;
    final ProductBloc productBloc = appBloc.productBloc;

    print("_BestSellingProductListWidgetState build");

    if (productBloc.requestForFirstTime) {
      productBloc.getProductList();
      productBloc.requestForFirstTime = false;
      print("Start geting products");
    }

    return StreamBuilder<ProductListResponse>(
      stream: productBloc.subject.stream,
      builder: (context, AsyncSnapshot<ProductListResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildProductListWidget(snapshot.data.results);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildProductListWidget(List<Product> products) {
    var size = MediaQuery.of(context).size;

    double _crossAxisSpacing = 5, _mainAxisSpacing = 5;
    int _crossAxisCount = 2;
//    /*24 is for notification bar on Android*/
//    final double itemHeight = (size.height - kToolbarHeight - 24) * 0.5;
//    final double itemWidth = size.width * 0.5;
//    final double _aspectRatio = (itemWidth /itemHeight);

    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(5.0),
        itemCount: products.length,
        shrinkWrap: true,
//        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount,
          crossAxisSpacing: _crossAxisSpacing,
          mainAxisSpacing: _mainAxisSpacing,
          childAspectRatio: 3.0 / 4.75,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: products[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailScreen(item: products[index]),
                ),
              );
            },
          );
        });
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Loading data..."), CircularProgressIndicator()],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Maaf ada error : $error"),
      ],
    ));
  }
}
