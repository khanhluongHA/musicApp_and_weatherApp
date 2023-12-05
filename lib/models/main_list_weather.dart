class MainWeather {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int sea_level;
  final int grnd_level;
  final int humidity;
  final double temp_kf;

  MainWeather({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.sea_level,
    required this.grnd_level,
    required this.humidity,
    required this.temp_kf,
  });

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: json['temp'].toDouble(),
      feels_like: json['feels_like'].toDouble(),
      temp_min: json['temp_min'].toDouble(),
      temp_max: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      sea_level: json['sea_level'],
      grnd_level: json['grnd_level'],
      humidity: json['humidity'],
      temp_kf: json['temp_kf'].toDouble(),
    );
  }

  static List<MainWeather> convertToList(List<dynamic> json) {
    //json ở đây là data
    return json.map<MainWeather>((item) => MainWeather.fromJson(item)).toList();
    // post này là từng intem   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
