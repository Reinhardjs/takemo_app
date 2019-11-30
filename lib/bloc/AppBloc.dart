import 'package:takemo_app/bloc/ProductBloc.dart';

class AppBloc {

  ProductBloc _productBloc;

  AppBloc(): _productBloc = ProductBloc();

  ProductBloc get productBloc => _productBloc;

  dispose() {
    productBloc.dispose();
  }
}

final appBloc = AppBloc();