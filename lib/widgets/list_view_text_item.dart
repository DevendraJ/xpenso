import 'package:flutter/material.dart';

class ListViewTextItem extends StatelessWidget {
  final bool _isSelected;
  final String _text;

  ListViewTextItem(this._text, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (_isSelected)
            ? Theme.of(context).accentColor.withOpacity(.7)
            : Colors.grey[200],
      ),
      child: Text(
        _text,
        style: TextStyle(
          color: (!_isSelected)
              ? Theme.of(context).accentColor.withOpacity(.8)
              : Colors.grey[200],
        ),
      ),
    );
  }
}
