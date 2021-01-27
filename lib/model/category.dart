import 'package:xpenso/constants/category_type.dart';
import 'package:xpenso/model/generic_model.dart';

class Category extends GenericModel {
  final CategoryType type;

  const Category({
    this.type = CategoryType.expense,
    String title,
    int imageId,
    int id,
  }) : super(title: title, id: id, imageId: imageId);
}
