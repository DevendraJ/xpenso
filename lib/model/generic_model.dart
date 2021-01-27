import 'package:flutter/foundation.dart';

class GenericModel {
  final int id;
  final String title;
  final int imageId;

  const GenericModel({
    @required this.title,
    this.id = 0,
    this.imageId,
  });
}
