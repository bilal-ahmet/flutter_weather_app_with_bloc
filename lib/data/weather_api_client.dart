import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_weather_app_with_bloc/model/weather_model.dart';

class WeatherApiClient {
  Dio dio = Dio();
  final String baseUrl =
      "https://api.weatherapi.com/v1/current.json?key=ac37b81b57564fe7bc3161922240403&q=";

  Future<String> getLocationName(String sehirAdi) async {
    try {
      final String sehirUrl = baseUrl + sehirAdi;
      final gelenCevap = await dio.get(sehirUrl);

      List gelenCevapListe = [];

      if (gelenCevap.statusCode != 200) {
        throw Exception("veri gelmedi");
      }

      gelenCevapListe = (gelenCevap.data as List)
          .map((e) => WeatherModel.fromMap(e))
          .toList();
      String gelenSehirAdi = await gelenCevapListe[0]["name"];

      // Future<WeatherModel>
      //return WeatherModel.fromMap(gelenSehirAdi);
      return gelenSehirAdi;

      //return gelenSehirAdi;
    } on DioException catch (e) {
      return Future.error(e.message.toString());
    }
  }

  Future<WeatherModel> getWeather(String sehir) async {
    final havaDurumuUrl = baseUrl + sehir;
    final havaDurumuGelenCevap = await dio.get(havaDurumuUrl);

    if (havaDurumuGelenCevap.statusCode != 200) {
      throw Exception("hava durumu getirilemedi");
    }

    /*var cevapListe = (havaDurumuGelenCevap.data as List)
          .map((e) => WeatherModel.fromMap(e))
          .toList();*/

    var cevapJson = jsonDecode(havaDurumuGelenCevap.data);

    return WeatherModel.fromMap(cevapJson);

    /*final havaDurumuGelenCevabinJsonHali =
        (await jsonDecode(havaDurumuGelenCevap.data));
    return WeatherModel.fromMap(havaDurumuGelenCevabinJsonHali);*/
  }
}
