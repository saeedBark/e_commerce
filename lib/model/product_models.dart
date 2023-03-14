// To parse this JSON data, do
//
//     final productModels = productModelsFromJson(jsonString);

import 'dart:convert';

List<ProductModels> productModelsFromJson(String str) => List<ProductModels>.from(json.decode(str).map((x) => ProductModels.fromJson(x)));

String productModelsToJson(List<ProductModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModels {
  ProductModels({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse[category],
    "image": image,
    "rating": rating.toJson(),
  };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}




// class ProductModels {
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;
//
//   ProductModels(
//       {this.id,
//         this.title,
//         this.price,
//         this.description,
//         this.category,
//         this.image,
//         this.rating});
//
//   ProductModels.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating =
//     json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['category'] = this.category;
//     data['image'] = this.image;
//     if (this.rating != null) {
//       data['rating'] = this.rating!.toJson();
//     }
//     return data;
//   }
// }
//
// class Rating {
//   double? rate;
//   int? count;
//
//   Rating({this.rate, this.count});
//
//   Rating.fromJson(Map<String, dynamic> json) {
//     rate = json['rate'];
//     count = json['count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rate'] = this.rate;
//     data['count'] = this.count;
//     return data;
//   }
// }
