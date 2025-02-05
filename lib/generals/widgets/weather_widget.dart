import 'package:dumlupinargazetesi/generals/models/weather/weather_response_model.dart';
import 'package:dumlupinargazetesi/generals/themes/shadows.dart';
import 'package:dumlupinargazetesi/generals/utils/date_converter.dart';
import 'package:dumlupinargazetesi/generals/widgets/marquee_text.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';
import 'package:dumlupinargazetesi/presentation/home/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WeatherWidget extends GetView<HomePageController> {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isGettingExchange.isTrue) {
        return SizedBox.shrink();
      } else {
        WeatherData? data = controller.kutahyaWeatherData;

        if (data == null) return SizedBox.shrink();
        List<MapEntry<String, DayWeather>?> days = data.days!.entries.toList();

        return IntrinsicHeight(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.6,
                image: AssetImage(Assets.images.weather.path),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Kutahya hava durumu",
                  style: const TextStyle(
                    fontSize: 15,
                    shadows: DumlupinarShadows.textShadow,
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      days.length,
                      (index) => WeatherItem(
                        data: days[index]!,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}

class WeatherItem extends StatelessWidget {
  const WeatherItem({super.key, required this.data});

  final MapEntry<String, DayWeather> data;

  @override
  Widget build(BuildContext context) {
    DayWeather weather = data.value;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateUtil.formatTurkishDate(data.key),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                shadows: DumlupinarShadows.textShadow,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TemperatureRow(iconPath: Assets.icons.up.path, value: weather.max!),
                TemperatureRow(iconPath: Assets.icons.down.path, value: weather.min!),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 25,
                child: AutoMarqueeText(
                  text: weather.conditions ?? '',
                  pauseAfterRound: Duration(seconds: 3),
                  style: const TextStyle(
                    fontSize: 12,
                    shadows: DumlupinarShadows.textShadow,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TemperatureRow extends StatelessWidget {
  final String iconPath;
  final int value;

  const TemperatureRow({
    super.key,
    required this.iconPath,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: DumlupinarShadows.darkShadow,
          ),
          child: SvgPicture.asset(
            iconPath,
            height: 12.5,
            width: 12.5,
            alignment: Alignment.center,
          ),
        ),
        const SizedBox(width: 2.5),
        Text(
          "$value",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            shadows: DumlupinarShadows.textShadow,
          ),
        ),
      ],
    );
  }
}
