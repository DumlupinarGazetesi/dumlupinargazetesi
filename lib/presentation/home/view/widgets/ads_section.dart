import 'package:dumlupinargazetesi/generals/models/advertisements/advertisement.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsSection extends GetView<HomePageController> {
  const AdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getAdvertisements(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }

          if (snapshot.hasError) return SizedBox.shrink();

          if (snapshot.hasData) {
            final List<Advertisement> adverts = controller.advertisements?.data?.adverts ?? [];

            return SizedBox(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              child: CarouselView(
                onTap: (index) {},
                backgroundColor: Colors.transparent,
                itemExtent: MediaQuery.sizeOf(context).width,
                children: adverts
                    .map(
                      (ad) => Image.network(
                        ad.images!.mobile!,
                      ),
                    )
                    .toList(),
              ),
            );
          }

          return SizedBox.shrink();
        });
  }
}
