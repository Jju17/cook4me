import 'package:flutter/foundation.dart';

class Meal {
  String id;
  String name;
  String desc;
  String image;

  Meal({this.name, this.image, this.desc, this.id});

  Meal.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['meal_title'],
        image = json['meal_image'],
        desc = json['meal_desc'];
}
