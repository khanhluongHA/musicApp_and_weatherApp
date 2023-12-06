import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/weather_bloc.dart';
import 'package:test_bloc/bloc/weather_state.dart';
import 'package:test_bloc/config/app_size.dart';
import 'package:test_bloc/screens/weather_page/wather_page.dart';

// ignore: must_be_immutable
class SearchCity extends StatelessWidget {
  SearchCity({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = context.read<WeatherBloc>();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const SizedBox(
                      width: 40, height: 40, child: Icon(Icons.arrow_back))),
              Text(
                'Tìm kiếm',
                style: TextStyle(fontSize: AppSize.size20),
              ),
              const SizedBox(
                width: 40,
                height: 40,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 45,
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Nhập tên thành phố',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Colors.greenAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Colors.greenAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Colors.greenAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Colors.greenAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state.status == WeatherStatus.success) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeatherPage()));
              }
            },
            child: ElevatedButton(
                onPressed: () async {
                  weatherBloc.add(
                      GetLocation(city: _controller.text.trim().toUpperCase()));
                  // ignore: use_build_context_synchronously
                },
                child: const Text('Tìm kiếm')),
          )
        ],
      )),
    );
  }
}
