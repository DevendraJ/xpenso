import 'package:flutter/material.dart';
import 'package:xpenso/model/generic_model.dart';

class GridViewItem<T extends GenericModel> extends StatefulWidget {
  final bool _isSelected;
  final Function _onPressed;
  final T _model;

  GridViewItem(this._model, this._isSelected, this._onPressed);

  @override
  _GridViewItemState createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: (widget._isSelected) ? Colors.yellow : Colors.grey,
              )),
          child: RawMaterialButton(
              onPressed: widget._onPressed,
              child: Icon(
                Icons.account_balance,
                color: Colors.grey,
              )),
        ),
        Text(
          widget._model.title,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
