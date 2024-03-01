import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/widgets/last_update_widget.dart';
import 'package:flutter_weather_app_with_bloc/widgets/location_widget.dart';
import 'package:flutter_weather_app_with_bloc/widgets/max_min_temp_widget.dart';
import 'package:flutter_weather_app_with_bloc/widgets/weather_picture_widget.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text("weather app", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.white,))
        ],
      ),
      body: Center(
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: LocationWidget()),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: LastUpdateWidget()),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: WeatherPictureWidget()),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: MaxMinTemperatureWidget()),
            ),
          ],
        ),
      ),
    );
  }
}