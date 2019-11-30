import 'package:dio/dio.dart';
import 'package:takemo_app/model/Product.dart';

class ProductApi {
  final String _endpoint = "https://api.jsonbin.io/b/5dd25c1f3da40e6f298b80e8/4";
  final Dio _dio = Dio();

  Future<ProductResponse> getProductResponse() async {
    try {
      Response response = await _dio.get(_endpoint);
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      print("Product responses " + productResponse.products.length.toString());
      return productResponse;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductResponse.withError("$error");
    }
  }

}