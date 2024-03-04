
import 'package:flutter_weather_app_with_bloc/data/weather_api_client.dart';
import 'package:flutter_weather_app_with_bloc/data/weather_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){

  // repodan istek gelince çalışması için lazy kullandık. direkt singleton yazsaydık app başlayınca çalışacaktı
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
}