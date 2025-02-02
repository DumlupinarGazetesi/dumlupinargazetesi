import 'package:dumlupinargazetesi/generals/constants/colors.dart';
import 'package:dumlupinargazetesi/generals/models/weather/weather_response_model.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.5,
          image: AssetImage(Assets.images.weather.path),
        ),
      ),
      child: Column(
        children: [
          Text("kutahya hava durumu"),
          SizedBox(height: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeatherItem(),
                WeatherItem(),
                WeatherItem(),
                WeatherItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    super.key,
    // required this.data,
  });

  // final Map<String, DayWeather> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("2025-02-02"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.up.path,
                    height: 10,
                    alignment: Alignment.center,
                    width: 10,
                  ),
                  Text("16"),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.down.path,
                    height: 10,
                    alignment: Alignment.center,
                    width: 10,
                  ),
                  Text("2"),
                ],
              ),
            ],
          ),
          Text("Güneşli"),
        ],
      ),
    );
  }
}
