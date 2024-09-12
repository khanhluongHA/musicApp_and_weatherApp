import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/weather_bloc.dart';
import 'package:test_bloc/bloc/weather_state.dart';
import 'package:test_bloc/screens/weather_page/wather_page.dart';

// ignore: must_be_immutable
class SearchCity extends StatefulWidget {
  SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = context.read<WeatherBloc>();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  const Text(
                    'Tìm kiếm thành phố',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 55,
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Nhập tên thành phố',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.grey), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.grey), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Colors.grey), //<-- SEE HERE
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeatherPage()),
                      (route) => false);
                }
              },
              child: ElevatedButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();

                    weatherBloc.add(GetLocation(
                        city: _controller.text.trim().toUpperCase()));
                    // ignore: use_build_context_synchronously
                  },
                  child: const Text('Tìm kiếm')),
            )
          ],
        ),
      )),
    );
  }
}
