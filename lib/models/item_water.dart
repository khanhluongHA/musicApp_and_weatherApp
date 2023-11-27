import 'package:copy_with_extension/copy_with_extension.dart';
part 'item_water.g.dart';

@CopyWith()
class ItemWater {
  ItemWater({
    required this.id,
    required this.name,
    required this.price,
  });
  final String id;
  final String name;
  final int price;
}
