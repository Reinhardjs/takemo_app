import '../entities/Product.dart';

class ProductResponse {
  final Product result;
  final String error;

  ProductResponse(this.result, this.error);

  ProductResponse.fromJson(Map<String, dynamic> parsedJson)
      : result = parsedJson["result"] as Product,
        error = "";

  ProductResponse.withError(String errorValue)
      : result = Product(),
        error = errorValue;
}