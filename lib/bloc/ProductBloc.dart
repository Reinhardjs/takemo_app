import 'package:rxdart/rxdart.dart';
import 'package:takemo_app/model/Product.dart';
import 'package:takemo_app/repository/ProductRepository.dart';

class ProductBloc {

  final ProductRepository _productRepository = ProductRepository();
  final BehaviorSubject<ProductResponse> _subject = BehaviorSubject<ProductResponse>();

  bool requestForFirstTime = true;

  getProducts() async {
    ProductResponse response = await _productRepository.getProductResponse();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ProductResponse> get subject => _subject;

}