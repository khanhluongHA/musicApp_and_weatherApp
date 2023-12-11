
import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';
@JsonSerializable()
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

    factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);


  static List<LocationModel> convertToList(List<dynamic> json) {
    //json ở đây là data
    return json
        .map<LocationModel>((item) => LocationModel.fromJson(item))
        .toList();
    // post này là từng intem   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
