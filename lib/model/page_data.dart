class PageData {
  List<Products>? products;

  PageData({this.products});

  PageData.fromJson(Map<String, dynamic> json) {
    if (json["products"] is List) {
      products = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => Products.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data["products"] = products!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productName;
  String? productUrl;
  String? productRating;
  String? productDescription;

  Products(
      {this.productName,
      this.productUrl,
      this.productRating,
      this.productDescription});

  Products.fromJson(Map<String, dynamic> json) {
    if (json["productName"] is String) {
      productName = json["productName"];
    }
    if (json["productUrl"] is String) {
      productUrl = json["productUrl"];
    }
    if (json["productRating"] is String) {
      productRating = json["productRating"];
    }
    if (json["productDescription"] is String) {
      productDescription = json["productDescription"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["productName"] = productName;
    data["productUrl"] = productUrl;
    data["productRating"] = productRating;
    data["productDescription"] = productDescription;
    return data;
  }
}
