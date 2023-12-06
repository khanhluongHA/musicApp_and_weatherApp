class LocationModel {
  final String name;
    final Map<String, dynamic> local_names;
    final double lat;
    final double lon;
    final String country;

    LocationModel({
        required this.name,
        required this.local_names,
        required this.lat,
        required this.lon,
        required this.country,
    });

    factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      local_names: json['local_names'],
      lat: json['lat'],
      lon: json['lon'],
      country: json['country'],
    );
  }

  static List<LocationModel> convertToList(List<dynamic> json) {
    //json ở đây là data
    return json
        .map<LocationModel>((item) => LocationModel.fromJson(item))
        .toList();
    // post này là từng intem   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
