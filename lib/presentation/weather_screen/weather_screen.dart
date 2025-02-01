import 'package:dumlupinargazetesi/generals/models/city/city_model.dart';
import 'package:dumlupinargazetesi/generals/utils/json_file_reader.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  City? selectedCity;

  List<City> cities = [];

  readCities() async {
    JsonReader reader = JsonReader(asset: "assets/cities.json");
    List<Map<String, dynamic>> readCities = await reader.readFile();

    for (Map<String, dynamic> city in readCities) {
      cities.add(City.fromJson(city));
    }
  }

  @override
  void initState() {
    readCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize();

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(title: const Text("Hava Durumu"), centerTitle: true),
    //   body: weatherData == null
    //       ? const Center(child: CircularProgressIndicator())
    //       : Padding(
    //           padding: const EdgeInsets.all(16.0),
    //           child: Column(
    //             children: [
    //               DropdownButton<String>(
    //                 value: selectedCity,
    //                 items: cities.map((String city) {
    //                   return DropdownMenuItem<String>(
    //                     value: city,
    //                     child: Text(city),
    //                   );
    //                 }).toList(),
    //                 onChanged: (newCity) {
    //                   setState(() {
    //                     selectedCity = newCity!;
    //                   });
    //                   fetchWeather(newCity!);
    //                 },
    //               ),
    //               const SizedBox(height: 20),
    //               _buildCurrentWeather(),
    //               const SizedBox(height: 20),
    //               Expanded(child: _buildForecastList()),
    //             ],
    //           ),
    //         ),
    // );
  }

  // Widget _buildCurrentWeather() {
  //   return Card(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //     elevation: 5,
  //     color: Colors.blueAccent,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         children: [
  //           Text(
  //             selectedCity,
  //             style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
  //           ),
  //           const SizedBox(height: 10),
  //           Text(
  //             "${weatherData!["main"]["temp"].toString()}°C",
  //             style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
  //           ),
  //           Text(
  //             weatherData!["weather"][0]["description"].toString().toUpperCase(),
  //             style: const TextStyle(fontSize: 18, color: Colors.white70),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildForecastList() {
  //   return ListView.builder(
  //     itemCount: 5,
  //     itemBuilder: (context, index) {
  //       final forecast = forecastData![index * 8]; // 8 timestamps per day
  //       final date = DateTime.parse(forecast["dt_txt"]);
  //       return Card(
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         elevation: 3,
  //         child: ListTile(
  //           leading: Icon(
  //             _getWeatherIcon(forecast["weather"][0]["main"]),
  //             color: Colors.blueAccent,
  //           ),
  //           title: Text(DateFormat("dd MMM EEE", "tr").format(date)),
  //           subtitle: Text(
  //             "${forecast["main"]["temp_max"]}°C / ${forecast["main"]["temp_min"]}°C - ${forecast["weather"][0]["description"]}",
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case "clear":
        return Icons.wb_sunny;
      case "clouds":
        return Icons.wb_cloudy;
      case "rain":
        return Icons.grain;
      default:
        return Icons.cloud;
    }
  }
}
