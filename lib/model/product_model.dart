class Product {
  String brand;
  List images;
  String inStack;
  String prodRating;
  String prodCategory;
  String prodDescription;
  String prodId;
  String prodName;
  String prodPrice;
  List prodSize;
  String prodSubcategory;
  String quantityInStock;
  List searchKey;
  String thumbImage;

  Product(
      {this.brand,
      this.images,
      this.inStack,
      this.prodRating,
      this.prodCategory,
      this.prodDescription,
      this.prodId,
      this.prodName,
      this.prodPrice,
      this.prodSize,
      this.prodSubcategory,
      this.quantityInStock,
      this.searchKey,
      this.thumbImage});

  Product.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    images = json['images'];
    inStack = json['inStack'];
    prodRating = json['prodRating'];
    prodCategory = json['prodCategory'];
    prodDescription = json['prodDescription'];
    prodId = json['prodId'];
    prodName = json['prodName'];
    prodPrice = json['prodPrice'];
    prodSize = json['prodSize'];
    prodSubcategory = json['prodSubcategory'];
    quantityInStock = json['quantityInStock'];
    searchKey = json['searchKey'];
    thumbImage = json['thumbImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['images'] = this.images;
    data['inStack'] = this.inStack;
    data['prodRating'] = this.prodRating;
    data['prodCategory'] = this.prodCategory;
    data['prodDescription'] = this.prodDescription;
    data['prodId'] = this.prodId;
    data['prodName'] = this.prodName;
    data['prodPrice'] = this.prodPrice;
    data['prodSize'] = this.prodPrice;
    data['prodSubcategory'] = this.prodSubcategory;
    data['quantityInStock'] = this.quantityInStock;
    data['searchKey'] = this.searchKey;
    data['thumbImage'] = this.thumbImage;
    return data;
  }
}
