import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_with_bloc/blocs/bloc/weather_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        return Text(
          "son güncelleme  ${
            //const TimeOfDay(hour: 21, minute: 02).format(context)
            ((state as WeatherLoadedState).weather.current!.lastUpdated)
            }",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        );
      },
    );
  }
}
