import 'package:dumlupinargazetesi/generals/constants/colors.dart';
import 'package:dumlupinargazetesi/generals/models/exchange/exchange_response_model.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeWidget extends GetView<HomePageController> {
  const ExchangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isGettingExchange.isTrue) {
          return SizedBox.shrink();
        } else {
          Map<String, PriceData>? data = controller.exchange?.data;

          if (data == null || data.isEmpty) return SizedBox.shrink();

          List<MapEntry<String, PriceData>> items = data.entries.toList();

          return Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: DumlupinarColors.tintColor,
                  width: 0.8,
                ),
                bottom: BorderSide(
                  color: DumlupinarColors.tintColor,
                  width: 0.8,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                (items.length * 2) - 1,
                (index) {
                  if (index.isOdd) {
                    // Vertical Divider
                    return SizedBox(
                      width: 1,
                      height: 50,
                      child: VerticalDivider(
                        width: 1,
                        color: DumlupinarColors.backgroundColor,
                      ),
                    );
                  } else {
                    int dataIndex = index ~/ 2; // Get correct item index
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8), // Space between items
                      child: ExchangeDetail(
                        title: items[dataIndex].key,
                        priceData: items[dataIndex].value,
                      ),
                    );
                  }
                },
              ),
            ),
          );
        }
      },
    );
  }
}

class ExchangeDetail extends StatelessWidget {
  const ExchangeDetail({
    super.key,
    required this.title,
    required this.priceData,
  });

  final String title;
  final PriceData priceData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2.5),
        Container(
          height: 20,
          padding: EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: priceData.dir == 'up' ? DumlupinarColors.greenColor : DumlupinarColors.primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            priceData.val ?? '0.0',
            style: TextStyle(
              fontSize: 12,
              color: DumlupinarColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
