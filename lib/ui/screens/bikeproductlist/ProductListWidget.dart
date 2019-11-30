import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/bloc/BlocProvider.dart';
import 'package:takemo_app/model/Product.dart';
import 'package:takemo_app/ui/screens/bikeproductlist/widgets/ProductBox.dart';
import '../bikeproductdetail/ProductDetailScreen.dart';

class ProductListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductListWidgetState();
  }
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    var productBloc = BlocProvider.of(context).productBloc;

    if (productBloc.requestForFirstTime) {
      productBloc.getProducts();
      productBloc.requestForFirstTime = false;
      print("Start geting products");
    }

    return StreamBuilder<ProductResponse>(
      stream: productBloc.subject.stream,
      builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildProductListWidget(snapshot.data.products);
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
      children: [Text("Loading data dari API..."), CircularProgressIndicator()],
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
