import 'package:takemo_app/api/ProductApi.dart';
import 'package:takemo_app/model/Product.dart';

class ProductRepository {
  ProductApi _apiProvider = ProductApi();

  Future<ProductResponse> getProductResponse(){
    return _apiProvider.getProductResponse();
  }

}