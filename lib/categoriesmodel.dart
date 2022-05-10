// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
     this.success,
     this.response,
  });

  bool success;
  Response response;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    success: json["success"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response": response.toJson(),
  };
}

class Response {
  Response({
     this.message,
  });

  List<Message> message;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
  };
}

class Message {
  Message({
     this.id,
     this.title,
     this.subCategories,
  });

  String id;
  String title;
  List<SubCategory> subCategories;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    title: json["title"],
    subCategories: List<SubCategory>.from(json["sub_categories"].map((x) => SubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "sub_categories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
  };
}

class SubCategory {
  SubCategory({
     this.id,
     this.title,
     this.category,
  });

  String id;
  String title;
  String category;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    title: json["title"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
  };
}
