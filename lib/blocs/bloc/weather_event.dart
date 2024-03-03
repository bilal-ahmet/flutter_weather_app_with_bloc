part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}


class FetchWeatherEvent extends WeatherEvent{
  // fetch yakalamak demek
  // burada ekrana bir şehrin hava durumunu getirmek istiyoruz. O yüzden sadece şehir adından oluşan bir değişken tanımlamk yeterli

  final String sehirAdi;

  FetchWeatherEvent({required this.sehirAdi});

  // bunu kullanmakdaki sebep aynı veri varken tekrar build etmeyi önlemek. mesela API'den ankara şehrinin hava durumu getirildi sonra
  // build tekrar çalıştı diyelim bu sefer ankara verileri tekrar API'den çekilerek getirilecek. equatable paketini kullanarak diyoruz ki
  // eğer build'ten sonra gelen şehir de var olan ile eşitse o zaman bu alanı tekrar çalıştırma diyeceğiz.
  @override
  List<Object> get props => [sehirAdi];
}