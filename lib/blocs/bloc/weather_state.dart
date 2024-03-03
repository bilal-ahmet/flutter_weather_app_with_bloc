part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

// WeatherEvent'de oluşup WeatherState'e gelen durumları burada ele alıyoruz. Neler olabilir: veri geliyor, geldi, gelirken hata oluştu vb.
// çıktı olarak kaşılaşabileceğimiz durumları burada ele alıyoruz.

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  // burada nesneler üretmeliyiz ki gelen bilgileri değerlendirebilelim. hava durumu nedir vb gibi bilgiler için
  // WeatherModel sınıfı API'den gelen verileri tutacak bizde gelen verileri bu sınıf üzerinden erişebileceğiz.

  final WeatherModel weather;

  WeatherLoadedState({required this.weather});

  // bu kod equatable sınıfını extend edebilmek için kullanıldı. equatable paketinin kullanımında bu şekilde bulunuyordu.
  // eskiden super([weather]) diyerek erişim sağlanıyordu.
  @override
  List<Object> get props => [weather];


}

class WeatherErrorState extends WeatherState{}
