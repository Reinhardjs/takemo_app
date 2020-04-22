import 'package:dio/dio.dart';
import 'package:takemo_app/model/responses/ProductResponse.dart';
import 'package:takemo_app/model/responses/ProductListResponse.dart';

class ProductApi {
  final Dio _dio = Dio();

  Future<ProductListResponse> getProductList() async {
    final String _endpoint = "https://api.jsonbin.io/b/5dd25c1f3da40e6f298b80e8/5";

    try {
      Response response = await _dio.get(_endpoint);
      ProductListResponse productResponse = ProductListResponse.fromJson(response.data);
      print("Product responses " + productResponse.results.length.toString());
      return productResponse;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductListResponse.withError("$error");
    }
  }

  Future<ProductResponse> getProductById(int id) async {
    final String _endpoint = "https://api.jsonbin.io/b/5dd25c1f3da40e6f298b80e8/5";

    try {
      // Response response = await _dio.get(_endpoint, queryParameters: {"id": id});
      Response response = await _dio.get(_endpoint);
      ProductResponse productDetailResponse = ProductResponse.fromJson(response.data);
      return productDetailResponse;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductResponse.withError("$error");
    }
  }

}
