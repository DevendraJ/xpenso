import 'package:flutter/material.dart';
import 'package:xpenso/constants/category_type.dart';
import 'package:xpenso/model/generic_model.dart';

class Category extends GenericModel {
  final CategoryType type;
  final Color color;

  const Category(
      {this.type = CategoryType.expense,
      this.color = Colors.orange,
      String title,
      int id})
      : super(title: title, id: id);
}
