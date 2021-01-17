import 'package:flutter/foundation.dart';

class GenericModel {
  final int id;
  final String title;

  const GenericModel({
    @required this.title,
    this.id = 0,
  });
}
