import 'package:flutter/material.dart';
import 'package:xpenso/utility/data_store.dart';

class GridViewItem<T extends GenericModel> extends StatelessWidget {
  final bool _isSelected;
  final T _model;
  final Color _selectedColor;

  GridViewItem(this._model, this._isSelected, this._selectedColor);

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
                color: (_isSelected) ? _selectedColor : Colors.white10,
              )),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              DataStore.getAppImage(_model.imageId).imagePath,
              height: 30,
            ),
          ),
        ),
        Text(
          _model.title,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
