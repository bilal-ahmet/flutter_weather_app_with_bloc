import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app_with_bloc/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {

    on<FetchWeatherEvent>((event, emit) {
      emit(WeatherLoadingState());
    });

    on<FetchWeatherEvent>((event, emit) {
      emit(WeatherLoadedState(weather: WeatherModel()));
    });

    on<FetchWeatherEvent>((event, emit) {
      emit(WeatherErrorState());
    });

  }
}
 