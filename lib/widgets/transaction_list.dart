import 'package:flutter/material.dart';
import 'package:xpenso/utility/data_store.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> txList;

  final Function onPressed;

  TransactionList({this.txList, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ...txList.map((tx) {
            var categoryId = tx.categoryId;
            var categoryName;
            var image;

            if (categoryId != null) {
              var category = DataStore.getCategory(tx.categoryId);
              image = DataStore.getAppImage(category.imageId);
              categoryName = category.title;
            } else {
              image = DataStore.defaultAppImage;
              categoryName = 'Transfer';
            }

            return Card(
              child: ListTile(
                title: Text(categoryName),
                subtitle: Text(tx.amount.toStringAsFixed(2)),
                leading: Image.asset(
                  image.imagePath,
                  height: 25,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    onPressed(tx.id);
                  },
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
