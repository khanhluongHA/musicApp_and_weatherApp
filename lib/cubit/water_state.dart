import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'water_state.g.dart';

enum WaterStatus { init,start, success, error }

@CopyWith()
class WaterState extends Equatable {
  const WaterState(
      {this.waterMap = const {},
      this.ids = const [],
      this.status = WaterStatus.init});
  final Map<String, dynamic>? waterMap;
  final List<String> ids;
  final Enum status;

  @override
  List<Object?> get props => [waterMap, ids, status];
}
