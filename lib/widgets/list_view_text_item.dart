import 'package:flutter/material.dart';

class ListViewTextItem extends StatelessWidget {
  final bool _isSelected;
  final String _text;
  final Color _selectedColor;

  ListViewTextItem(this._text, this._isSelected, this._selectedColor);

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
          border: Border.all(
            color: (_isSelected) ? _selectedColor : Colors.grey[350],
            width: 3,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Text(_text),
    );
  }
}
