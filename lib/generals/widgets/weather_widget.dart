import 'package:dumlupinargazetesi/generals/constants/colors.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
        children: List.generate(4 * 2 - 1, (index) {
          if (index.isOdd) {
            return SizedBox(
              width: 1,
              height: 50,
              child: VerticalDivider(
                width: 1,
                color: DumlupinarColors.backgroundColor,
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DOLAR",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "35.8440",
                style: TextStyle(fontSize: 12),
              ),
              Container(
                height: 20,
                padding: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: DumlupinarColors.greenColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "0.12%",
                  style: TextStyle(
                    fontSize: 12,
                    color: DumlupinarColors.whiteColor,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
