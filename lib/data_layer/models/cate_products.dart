// To parse required this JSON data, do
//
//     final categoryProduct = categoryProductFromJson(jsonString);

import 'dart:convert';

List<CategoryProduct> categoryProductFromJson(String str) =>
    List<CategoryProduct>.from(
        json.decode(str).map((x) => CategoryProduct.fromJson(x)));

String categoryProductToJson(List<CategoryProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryProduct {
  CategoryProduct({
    required this.productId,
    required this.productName,
    required this.productSlug,
    required this.permalink,
    required this.dateCreated,
    required this.dateModified,
    required this.status,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.categories,
    required this.productImages,
    required this.priceHtml,
    required this.stockStatus,
    required this.productOwner,
  });

  int productId;
  String productName;
  String productSlug;
  String permalink;
  DateTime dateCreated;
  DateTime dateModified;
  String status;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  List<Category> categories;
  List<ProductImage> productImages;
  String priceHtml;
  String stockStatus;
  ProductOwner productOwner;

  factory CategoryProduct.fromJson(Map<String, dynamic> json) =>
      CategoryProduct(
        productId: json["product_id"],
        productName: json["product_name"],
        productSlug: json["product_slug"],
        permalink: json["permalink"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateModified: DateTime.parse(json["date_modified"]),
        status: json["status"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        productImages: List<ProductImage>.from(
            json["product_images"].map((x) => ProductImage.fromJson(x))),
        priceHtml: json["price_html"],
        stockStatus: json["stock_status"],
        productOwner: ProductOwner.fromJson(json["product_owner"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_slug": productSlug,
        "permalink": permalink,
        "date_created": dateCreated.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "status": status,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "product_images":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
        "price_html": priceHtml,
        "stock_status": stockStatus,
        "product_owner": productOwner.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  int id;
  String name;
  String slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class ProductImage {
  ProductImage({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String src;
  String name;
  String alt;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };
}

class ProductOwner {
  ProductOwner({
    required this.id,
    required this.name,
    required this.shopName,
    required this.url,
    required this.address,
  });

  int id;
  String name;
  String shopName;
  String url;
  dynamic address;

  factory ProductOwner.fromJson(Map<String, dynamic> json) => ProductOwner(
        id: json["id"],
        name: json["name"],
        shopName: json["shop_name"],
        url: json["url"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shop_name": shopName,
        "url": url,
        "address": address,
      };
}

class AddressClass {
  AddressClass({
    required this.street1,
    required this.street2,
    required this.city,
    required this.zip,
    required this.country,
    required this.state,
  });

  String street1;
  String street2;
  String city;
  String zip;
  String country;
  String state;

  factory AddressClass.fromJson(Map<String, dynamic> json) => AddressClass(
        street1: json["street_1"],
        street2: json["street_2"],
        city: json["city"],
        zip: json["zip"],
        country: json["country"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "street_1": street1,
        "street_2": street2,
        "city": city,
        "zip": zip,
        "country": country,
        "state": state,
      };
}
