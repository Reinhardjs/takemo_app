import 'package:takemo_app/bloc/ProductBloc.dart';

import 'LoginBloc.dart';

class AppBloc {

  ProductBloc _productBloc;
  LoginBloc _loginBloc;

  AppBloc() : _productBloc = ProductBloc();

  ProductBloc get productBloc => _productBloc;

  LoginBloc get loginBloc => _loginBloc;

  dispose() {
    if (_productBloc != null) {
      productBloc.dispose();
    }

    if (_loginBloc != null) {
      _loginBloc.dispose();
    }
  }
}

final appBloc = AppBloc();
