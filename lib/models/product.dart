class Product {
  int? id;
  int? categoryId;
  String productName = "";
  String quanityPerUnit = "";
  double? unitPrice;
  int? unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quanityPerUnit,
      this.unitPrice, this.unitsInStock);

  Product.fromJson(Map json) {
    id = int.tryParse(json["id"].toString());
    categoryId = int.tryParse(json["categoryID"].toString());
    productName = json["productName"].toString();
    quanityPerUnit = json["quanityPerUnit"].toString();
    unitPrice = double.tryParse(json["unitPrice"].toString());
    unitsInStock = int.tryParse(json["unitsInStock"].toString());
  }

  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "productName": productName,
      "quanityPerUnit": quanityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock
    };
  }
}
