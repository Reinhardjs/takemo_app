import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takemo_app/bloc/BlocProvider.dart';
import 'package:takemo_app/model/Product.dart';

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
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(products[index].name, style: TextStyle(fontSize: 20)),
        );
      },
      itemCount: products.length,
    );
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
