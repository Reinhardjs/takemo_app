import 'package:rxdart/rxdart.dart';
import 'package:takemo_app/bloc/BlocProvider.dart';
import 'package:takemo_app/model/responses/ProductListResponse.dart';
import 'package:takemo_app/repository/ProductRepository.dart';

class ProductBloc extends BlocBase {

  final ProductRepository _productRepository = ProductRepository();
  final BehaviorSubject<ProductListResponse> _subject = BehaviorSubject<ProductListResponse>();

  bool requestForFirstTime = true;

  getProductList() async {
    ProductListResponse response = await _productRepository.getProductList();
    _subject.sink.add(response);
  }

  @override
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ProductListResponse> get subject => _subject;

}