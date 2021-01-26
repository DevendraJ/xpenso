import 'package:flutter/material.dart';
import 'package:xpenso/constants/category_type.dart';
import 'package:xpenso/utility/data_store.dart';
import 'package:xpenso/widgets/grid_view_item.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  var _selectedType = CategoryType.expense;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _selectedType,
          items: [
            DropdownMenuItem(
                child: Text('Expense'), value: CategoryType.expense),
            DropdownMenuItem(child: Text('Income'), value: CategoryType.income),
          ],
          onChanged: (selectedValue) {
            setState(() {
              _selectedType = selectedValue;
            });
          },
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        child: GridView.count(
          crossAxisCount: 4,
          children: [
            ...DataStore.getCategories(_selectedType).map((category) {
              return GridViewItem(category, false, Colors.transparent);
            }),
          ],
        ),
      ),
    );
  }
}
