import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/widgets/category_entry_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryEntryItems extends StatelessWidget {
  const CategoryEntryItems({super.key, required this.entries});

  final List<Entry> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CatEntryItemWidget(entry: entries[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 15),
      itemCount: entries.length,
    );
  }
}
