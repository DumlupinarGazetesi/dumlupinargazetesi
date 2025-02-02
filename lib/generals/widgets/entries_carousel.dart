import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:flutter/material.dart';

class EntriesCarousel extends StatelessWidget {
  const EntriesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> entries = List.generate(
      5,
      (index) => Container(
        height: 300,
        color: index.isOdd ? Colors.red.shade300 : Colors.black26,
      ),
    );

    return CarouselView(
      itemExtent: MediaQuery.sizeOf(context).width,
      controller: CarouselController(),
      children: entries,
    );
  }
}
