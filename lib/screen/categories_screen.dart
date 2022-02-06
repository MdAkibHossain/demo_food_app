import '/widgets/categories_item.dart';
import '/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesSareen extends StatelessWidget {
  const CategoriesSareen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      children: dymmy_categoies
          .map((catData) => CategoriesItem(
                title: catData.title,
                color: catData.color,
                id: catData.id,
              ))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
