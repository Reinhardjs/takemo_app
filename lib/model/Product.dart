class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        price = json['price'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      };

  // Dummy data
  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(Product("Pixel", "Pixel is the most feature-full phone ever", 800,
        "pixel.png"));
    items.add(Product("Laptop", "Laptop is most productive development tool",
        2000, "laptop.png"));
    items.add(Product(
        "Tablet",
        "Tablet is the most useful device ever for meeting",
        1500,
        "tablet.png"));
    items.add(Product(
        "Pendrive", "Pendrive is useful storage medium", 100, "pendrive.png"));
    items.add(Product("Floppy Drive",
        "Floppy drive is useful rescue storage medium", 20, "floppy.png"));
    return items;
  }
}

class ProductResponse {
  final List<Product> products;
  final String error;

  ProductResponse(this.products, this.error);

  ProductResponse.fromJson(Map<String, dynamic> parsedJson)
      : products = (parsedJson["results"] as List)
            .map((jsonData) => new Product.fromJson(jsonData))
            .toList(),
        error = "";

  ProductResponse.withError(String errorValue)
      : products = List(),
        error = errorValue;
}
