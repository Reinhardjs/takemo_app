class Product {
  int id;
  String name;
  String description;
  int price;
  String imageUrl;

  Product(){
    this.id = -1;
    this.name = "";
    this.description = "";
    this.price = 0;
    this.imageUrl = "";
  }

  Product.from(Product product):
      id = product.id,
      name = product.name,
      description = product.description,
      price = product.price,
      imageUrl = product.imageUrl;

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        imageUrl = json['image'];

  Map<String, dynamic> toJson() => {
        'id' : id,
        'name': name,
        'description': description,
        'price': price,
        'image': imageUrl,
      };

}


