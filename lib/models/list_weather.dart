
class ListWeather {
  final int dt;
  final Map main;
  final List weather;
  final Map clouds;
  final Map wind;
  final int visibility;
  final int pop;
  final Map sys;
  final String dt_txt;

  ListWeather(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.clouds,
      required this.wind,
      required this.visibility,
      required this.pop,
      required this.sys,
      required this.dt_txt});

  factory ListWeather.fromJson(Map<String, dynamic> json) {
    return ListWeather(
      dt: json['dt'],
      main: json['main'],
      weather: json['weather'],
      clouds: json['clouds'],
      wind: json['wind'],
      visibility: json['visibility'],
      pop: json['pop'],
      sys: json['sys'],
      dt_txt: json['dt_txt'],
    );
  }

  static List<ListWeather> convertToList(List<dynamic> json) {
    //json ở đây là data
    return json.map<ListWeather>((item) => ListWeather.fromJson(item)).toList();
    // post này là từng intem   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
