import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app_with_bloc/data/weather_repository.dart';
import 'package:flutter_weather_app_with_bloc/get_it_locator.dart';
import 'package:flutter_weather_app_with_bloc/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial()) {

    on<FetchWeatherEvent>((event, emit) {
      emit(WeatherLoadingState());
    });

    on<FetchWeatherEvent>((event, emit) async {  
      final WeatherModel? getirilenWeather = await weatherRepository.getWeather(event.sehirAdi);

      emit(WeatherLoadedState(weather: getirilenWeather!));
    });

    on<FetchWeatherEvent>((event, emit) {
      emit(WeatherErrorState());
    });

  }
}
 