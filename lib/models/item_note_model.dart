import 'package:json_annotation/json_annotation.dart';
part 'item_note_model.g.dart';

@JsonSerializable()
class ItemNoteModel {
  late String title;
  late String content;
  late String time;
  late bool noteStatus;
  late String linkImage;

  ItemNoteModel(
      {required this.title,
      required this.content,
      required this.time,
      required this.noteStatus,
      required this.linkImage});

  factory ItemNoteModel.fromJson(Map<String, dynamic> json) =>
      _$ItemNoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemNoteModelToJson(this);

  static List<ItemNoteModel> convertToList(List<dynamic> json) {
    //json ở đây là data
    return json
        .map<ItemNoteModel>((item) => ItemNoteModel.fromJson(item))
        .toList();
    // post này là từng instance   ------------- post này là  để ấy vào trong fromjson trong factory rồi chuyển thành list
  }
}
