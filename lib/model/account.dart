import 'package:flutter/foundation.dart';
import 'package:xpenso/model/generic_model.dart';

class Account extends GenericModel {
  final double currBalance;

  Account({
    String title,
    @required this.currBalance,
    int id,
  }) : super(title: title, id: id);
}
