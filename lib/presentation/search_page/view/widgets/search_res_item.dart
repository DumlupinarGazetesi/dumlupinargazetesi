import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:flutter/material.dart';

class SearchResItem extends StatelessWidget {
  const SearchResItem({super.key, required this.entry});

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: Image.network(entry.image!.url!),
            ),
            const SizedBox(width: 15),
            Column(
              children: [
                Text(entry.title ?? ''),
                Row(
                  children: List.generate(
                    entry.categories?.length ?? 0,
                    (index) {
                      return Text(
                        "# ${entry.categories?[index].title}",
                        style: TextStyle(
                          color: DumlupinarColors.primaryColor,
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
