import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/cubit/water_cubit.dart';
import 'package:test_bloc/cubit/water_state.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  @override
  void initState() {
    context.read<WaterCubit>().getDataWater();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final waterCubit = context.read<WaterCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print(waterCubit.state.a);

          waterCubit.addWater('8', 'mận', 12000);
          waterCubit.addListObjects();
          print(waterCubit.state.a);
        },
      ),
      body: BlocBuilder<WaterCubit, WaterState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: state.waterMap!.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                      
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        color: Colors.green.withOpacity(0.6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ID: ${waterCubit.state.waterMap!.keys.elementAt(index)}',
                            ),
                            Text(
                              'Name: ${waterCubit.state.waterMap!.values.elementAt(index).name}',
                            ),
                            Text(
                              'Price: ${waterCubit.state.waterMap!.values.elementAt(index).price}',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
