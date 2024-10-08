import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherForecastPage("Moscow");
  }
}

class WeatherForecastPage extends StatefulWidget {
  WeatherForecastPage(this.cityName);

  final String cityName;

  @override
  State<StatefulWidget> createState() {
    return _WeatherForecastPageState();
  }
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  List<Weather> weatherForecast = [
    Weather(DateTime.now(), 20, 90, "04d"),
    Weather(DateTime.now().add(Duration(hours: 3)), 23, 50, "03d"),
    Weather(DateTime.now().add(Duration(hours: 6)), 25, 50, "02d"),
    Weather(DateTime.now().add(Duration(hours: 9)), 28, 50, "01d"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Weather forecast'),
          ),
          body: ListView.builder(
              itemCount: weatherForecast.length,
              itemBuilder: (BuildContext context, int index) {
                return WeatherListItem(weatherForecast[index]);
          })),
    );
  }
}
