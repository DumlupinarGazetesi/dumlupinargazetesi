import 'package:carousel_slider/carousel_slider.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/widgets/indicator.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntriesCarousel extends GetView<HomePageController> {
  const EntriesCarousel({super.key, required this.entries});

  final List<Entry>? entries;

  @override
  Widget build(BuildContext context) {
    List<Widget> entryWidgets = List.generate(
      entries?.length ?? 0,
      (index) => Container(
        height: 200,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              entries![index].image?.url ?? '',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: 200,
          width: MediaQuery.sizeOf(context).width / 1.5,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(colors: [
                Colors.black87,
                Colors.transparent,
              ])),
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 100,
            child: Text(
              entries![index].title ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );

    return Column(
      children: [
        CarouselSlider(
          items: entryWidgets,
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, _) {},
            height: 200,
            scrollPhysics: BouncingScrollPhysics(),
            disableCenter: false,
            reverse: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
          ),
        ),
        SizedBox(height: 5),
        IndicatorsWidget(properties: entryWidgets, actualIndex: 0)
      ],
    );
  }
}
