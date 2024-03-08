// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromMap(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromMap(String str) => WeatherModel.fromMap(json.decode(str));

String weatherModelToMap(WeatherModel data) => json.encode(data.toMap());

class WeatherModel {
    Location? location;
    Current? current;

    WeatherModel({
        this.location,
        this.current,
    });

    factory WeatherModel.fromMap(Map<String, dynamic> json) => WeatherModel(
        location: json["location"] == null ? null : Location.fromMap(json["location"]),
        current: json["current"] == null ? null : Current.fromMap(json["current"]),
    );

    Map<String, dynamic> toMap() => {
        "location": location?.toMap(),
        "current": current?.toMap(),
    };
}

class Current {
    int? lastUpdatedEpoch;
    String? lastUpdated;
    int? tempC;
    double? tempF;
    int? isDay;
    Condition? condition;
    double? windMph;
    double? windKph;
    int? windDegree;
    String? windDir;
    int? pressureMb;
    double? pressureIn;
    int? precipMm;
    int? precipIn;
    int? humidity;
    int? cloud;
    double? feelslikeC;
    double? feelslikeF;
    int? visKm;
    int? visMiles;
    int? uv;
    double? gustMph;
    double? gustKph;

    Current({
        this.lastUpdatedEpoch,
        this.lastUpdated,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.visKm,
        this.visMiles,
        this.uv,
        this.gustMph,
        this.gustKph,
    });

    factory Current.fromMap(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: json["condition"] == null ? null : Condition.fromMap(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        feelslikeF: json["feelslike_f"]?.toDouble(),
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toMap(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
    };
}

class Condition {
    String? text;
    String? icon;
    int? code;

    Condition({
        this.text,
        this.icon,
        this.code,
    });

    factory Condition.fromMap(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Location {
    String? name;
    String? region;
    String? country;
    double? lat;
    double? lon;
    String? tzId;
    int? localtimeEpoch;
    String? localtime;

    Location({
        this.name,
        this.region,
        this.country,
        this.lat,
        this.lon,
        this.tzId,
        this.localtimeEpoch,
        this.localtime,
    });

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
