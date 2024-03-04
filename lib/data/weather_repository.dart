import 'package:flutter_weather_app_with_bloc/data/weather_api_client.dart';
import 'package:flutter_weather_app_with_bloc/get_it_locator.dart';
import 'package:flutter_weather_app_with_bloc/model/weather_model.dart';

class WeatherRepository{
  // API'den gelen verilere ulaşacağımız yer.

  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<WeatherModel?> getWeather(String sehir) async{
    final int sehirId = await weatherApiClient.getLocationID(sehir);
    return await weatherApiClient.getWeather(sehirId);
  }
}