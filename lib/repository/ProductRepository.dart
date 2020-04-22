import 'package:takemo_app/api/ProductApi.dart';
import 'package:takemo_app/model/responses/ProductListResponse.dart';

class ProductRepository {
  ProductApi _apiProvider = ProductApi();

  Future<ProductListResponse> getProductList(){
    return _apiProvider.getProductList();
  }

}