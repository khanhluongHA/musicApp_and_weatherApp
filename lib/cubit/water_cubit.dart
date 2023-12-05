import 'package:bloc/bloc.dart';
import 'package:test_bloc/config/print_color.dart';
import 'package:test_bloc/cubit/water_state.dart';
import 'package:test_bloc/data/data_water.dart';
import 'package:test_bloc/models/item_water.dart';

class WaterCubit extends Cubit<WaterState> {
  WaterCubit() : super(const WaterState());

  Map<String, ItemWater> newWater = {};
  List<String> newIds = [];
  Future<void> getDataWater() async {
    emit(state.copyWith(status: WaterStatus.init));
    for (int i = 0; i < dataWater.length; i++) {
      newIds.add(dataWater[i].id);
      newWater[dataWater[i].id] = ItemWater(
        id: dataWater[i].id,
        name: dataWater[i].name,
        price: dataWater[i].price,
      );
    }
    print(newWater);
    emit(state.copyWith(
        ids: newIds, waterMap: newWater, status: WaterStatus.start));
    print(state.waterMap!.length);
  }

  void addWater(String id, String name, int price) {
    emit(state.copyWith(status: WaterStatus.init));
    newWater[id] = ItemWater(id: id, name: name, price: price);
    newIds.add(id);
    emit(state.copyWith(
        ids: newIds, waterMap: newWater, status: WaterStatus.success, a: 5));
  }

  void addListObjects() {
    emit(state.copyWith(status: WaterStatus.start));
    List<Map<String, ItemWater>> listObj = [
      {
        '10': ItemWater(id: '10', name: 'xoài', price: 10000),
      },
      {
        '11': ItemWater(id: '11', name: 'vải', price: 12000),
      },
    ];

    for (int i = 0; i < listObj.length; i++) {
      newWater.addAll(listObj[i]);
    }
    printCyan(newWater.toString());
    emit(state.copyWith(waterMap: newWater, status: WaterStatus.success));
  }
}
