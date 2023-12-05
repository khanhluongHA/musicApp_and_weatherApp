class WeatherModel {
  final String cod;
  final int message;
  final int cnt;
  final List list;
  final Map city;

  WeatherModel(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.list,
      required this.city});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: json['list'],
      city: json['city'],
    );
  }

  static List<WeatherModel> convertToList(List<dynamic> json) {
    //json ở đây là data
    return json
        .map<WeatherModel>((item) => WeatherModel.fromJson(item))
        .toList();
    // post này là từng intem   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
