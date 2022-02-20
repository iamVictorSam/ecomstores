// To parse required this JSON data, do
//
//     final allProducts = allProductsFromJson(jsonString);

import 'dart:convert';

List<AllProducts> allProductsFromJson(String str) => List<AllProducts>.from(
    json.decode(str).map((x) => AllProducts.fromJson(x)));

String allProductsToJson(List<AllProducts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProducts {
  AllProducts({
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
  Status status;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  List<Category> categories;
  List<ProductImage> productImages;
  String priceHtml;
  StockStatus stockStatus;
  ProductOwner productOwner;

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
        productId: json["product_id"],
        productName: json["product_name"],
        productSlug: json["product_slug"],
        permalink: json["permalink"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateModified: DateTime.parse(json["date_modified"]),
        status: statusValues.map[json["status"]]!,
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
        stockStatus: stockStatusValues.map[json["stock_status"]]!,
        productOwner: ProductOwner.fromJson(json["product_owner"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_slug": productSlug,
        "permalink": permalink,
        "date_created": dateCreated.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "status": statusValues.reverse[status],
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
        "stock_status": stockStatusValues.reverse[stockStatus],
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
  Alt alt;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: altValues.map[json["alt"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "src": src,
        "name": name,
        "alt": altValues.reverse[alt],
      };
}

enum Alt { EMPTY, OAK_THREADS }

final altValues = EnumValues({"": Alt.EMPTY, "oak Threads": Alt.OAK_THREADS});

class ProductOwner {
  ProductOwner({
    required this.id,
    required this.name,
    required this.shopName,
    required this.url,
    required this.address,
  });

  int id;
  Name? name;
  ShopName shopName;
  String url;
  Address address;

  factory ProductOwner.fromJson(Map<String, dynamic> json) => ProductOwner(
        id: json["id"],
        name: nameValues.map[json["name"]],
        shopName: shopNameValues.map[json["shop_name"]]!,
        url: json["url"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "shop_name": shopNameValues.reverse[shopName],
        "url": url,
        "address": address.toJson(),
      };
}

class Address {
  Address({
    required this.street1,
    required this.street2,
    required this.city,
    required this.zip,
    required this.country,
    required this.state,
  });

  Street1 street1;
  Street2 street2;
  City city;
  String zip;
  Country country;
  State state;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street1: street1Values.map[json["street_1"]]!,
        street2: street2Values.map[json["street_2"]]!,
        city: cityValues.map[json["city"]]!,
        zip: json["zip"],
        country: countryValues.map[json["country"]]!,
        state: stateValues.map[json["state"]]!,
      );

  Map<String, dynamic> toJson() => {
        "street_1": street1Values.reverse[street1],
        "street_2": street2Values.reverse[street2],
        "city": cityValues.reverse[city],
        "zip": zip,
        "country": countryValues.reverse[country],
        "state": stateValues.reverse[state],
      };
}

enum City { PORT_HARCOURT, CITY_PORT_HARCOURT }

final cityValues = EnumValues({
  "port harcourt": City.CITY_PORT_HARCOURT,
  "Port Harcourt": City.PORT_HARCOURT
});

enum Country { NG }

final countryValues = EnumValues({"NG": Country.NG});

enum State { RI }

final stateValues = EnumValues({"RI": State.RI});

enum Street1 {
  EMPTY,
  THE_8889_PETER_ODILI_ROAD,
  THE_7_ZION_AVENUE_ELIJIJI_ODANI
}

final street1Values = EnumValues({
  "": Street1.EMPTY,
  "7 zion avenue elijiji odani": Street1.THE_7_ZION_AVENUE_ELIJIJI_ODANI,
  "88/89 Peter Odili Road": Street1.THE_8889_PETER_ODILI_ROAD
});

enum Street2 { EMPTY, OFF_ODANI_ROAD_ELELENWO }

final street2Values = EnumValues({
  "": Street2.EMPTY,
  "off odani road elelenwo": Street2.OFF_ODANI_ROAD_ELELENWO
});

enum Name { DEBORAH_ANUNOBI, ELLISON_AMP_GATES, ABIOLA_AKINSEYE }

final nameValues = EnumValues({
  "Abiola Akinseye": Name.ABIOLA_AKINSEYE,
  "Deborah Anunobi": Name.DEBORAH_ANUNOBI,
  "Ellison &amp; Gates": Name.ELLISON_AMP_GATES
});

enum ShopName { EXCLUSIVE_SECRETS, ELLISON_GATES_LIMITED, OAK_THREADS }

final shopNameValues = EnumValues({
  "Ellison & Gates Limited": ShopName.ELLISON_GATES_LIMITED,
  "Exclusive secrets": ShopName.EXCLUSIVE_SECRETS,
  "OAK Threads": ShopName.OAK_THREADS
});

enum Status { PUBLISH, DRAFT }

final statusValues =
    EnumValues({"draft": Status.DRAFT, "publish": Status.PUBLISH});

enum StockStatus { INSTOCK }

final stockStatusValues = EnumValues({"instock": StockStatus.INSTOCK});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
