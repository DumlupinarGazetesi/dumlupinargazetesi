import 'package:carousel_slider/carousel_slider.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/utils/navigation.dart';
import 'package:dumlupinargazetesi/generals/widgets/indicator.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:dumlupinargazetesi/presentation/post_page/view/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'entry_tag_widget.dart';

class EntriesCarousel extends StatefulWidget {
  const EntriesCarousel({super.key, required this.entries});

  final List<Entry>? entries;

  @override
  State<EntriesCarousel> createState() => _EntriesCarouselState();
}

class _EntriesCarouselState extends State<EntriesCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.entries == null || widget.entries!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        CarouselSlider(
          items: widget.entries!
              .map(
                (entry) => GestureDetector(
                  child: _buildEntryItem(entry, context),
                  onTap: () {
                    Navigation.rightToLeft(
                      context,
                      PostDetailScreen(entryDetail: entry),
                    );

                  },
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, _) => setState(() => currentIndex = index),
            height: 200,
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeCenterPage: true,
            viewportFraction: 1,
          ),
        ),
        const SizedBox(height: 5),
        IndicatorsWidget(itemCount: widget.entries!.length, selectedIndex: currentIndex),
      ],
    );
  }

  Widget _buildEntryItem(Entry entry, BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(entry.image?.url ?? ''),
        _buildTitleOverlay(entry.title ?? '', context),
        Positioned(
          right: 10,
          top: 10,
          child: _buildCategoryTags(entry.categories ?? []),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage(String imageUrl) {
    return Container(
      height: 200,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitleOverlay(String title, BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.sizeOf(context).width / 1.5,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.transparent],
        ),
      ),
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 100,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTags(List<Category> categories) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => EntryTagWidget(tagTitle: categories[index].title ?? ''),
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: categories.length,
      ),
    );
  }
}
