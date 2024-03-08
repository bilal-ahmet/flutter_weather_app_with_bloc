import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/bloc/weather_bloc.dart';
import 'package:flutter_weather_app_with_bloc/widgets/last_update_widget.dart';
import 'package:flutter_weather_app_with_bloc/widgets/location_widget.dart';
import 'package:flutter_weather_app_with_bloc/widgets/max_min_temp_widget.dart';
import 'package:flutter_weather_app_with_bloc/widgets/selectCityWidget.dart';
import 'package:flutter_weather_app_with_bloc/widgets/weather_picture_widget.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {

    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    String pickedCity = "ANKARA";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text(
          "weather app",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                // selectCity'de pop geriye _textController.text ile veri veriyor bu veriyi await ile bekleyip değişkene atadık
                pickedCity = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const selectCityWidget()));
                if (pickedCity != null) {
                  _weatherBloc.add(FetchWeatherEvent(sehirAdi: pickedCity));
                  print(pickedCity);
                }
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: _weatherBloc,
          builder: (context, state) {

            if(state is WeatherInitial){
              return Center(child: Text("şehir seçiniz"),);
            }
            else if(state is WeatherLoadingState){
              return const Center(child:  CircularProgressIndicator());
            }
            else if(state is WeatherLoadedState){
              final getirilenWeather = state.weather;
              getirilenWeather.current!.lastUpdated;
              return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: LocationWidget(city: getirilenWeather.location!.name.toString()),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: LastUpdateWidget()),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: WeatherPictureWidget()),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: MaxMinTemperatureWidget()),
                ),
              ],
            );
            }

            else if(state is WeatherErrorState){
              return const Center(child: Text("hata oluştu"),);
            }
            return Text("hiçbir şey olmadı");
          },
        ),
      ),
    );
  }
}
