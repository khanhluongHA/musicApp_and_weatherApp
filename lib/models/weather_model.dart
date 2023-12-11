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

}
