import '../entities/Product.dart';

class ProductListResponse {
  final List<Product> results;
  final String error;

  ProductListResponse(this.results, this.error);

  ProductListResponse.fromJson(Map<String, dynamic> parsedJson)
      : results = (parsedJson["results"] as List)
      .map((jsonData) => new Product.fromJson(jsonData))
      .toList(),
        error = "";

  ProductListResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}