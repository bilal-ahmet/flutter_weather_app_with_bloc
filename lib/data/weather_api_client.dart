import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_weather_app_with_bloc/model/weather_model.dart';

class WeatherApiClient{
  Dio dio = Dio();
  final String baseUrl = Dio().options.baseUrl = "https://www.metaweather.com";

  Future<int> getLocationID(String sehirAdi)async{
    
    final String sehirUrl = baseUrl + "/api/location/search/?query=" + sehirAdi;
    final gelenCevap = await dio.get(sehirUrl);

    if(gelenCevap.statusCode != 200){
      throw Exception("veri getirilemedi");
    }

    final gelenCevapJson = (await jsonDecode(gelenCevap.data)) as List;
    return gelenCevapJson[0]["woeid"];

  }

  Future<WeatherModel> getWeather(int sehirId)async{
    final havaDurumuUrl = baseUrl + "/api/locator/" + sehirId.toString();
    final havaDurumuGelenCevap = await dio.get(havaDurumuUrl);

    if(havaDurumuGelenCevap.statusCode != 200){
      throw Exception("hava durumu getirilemedi");
    }

    final havaDurumuGelenCevabinJsonHali = (await jsonDecode(havaDurumuGelenCevap.data));
    return WeatherModel.fromMap(havaDurumuGelenCevap.data);
  }
}
