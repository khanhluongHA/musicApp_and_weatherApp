import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_bloc/config/app_api.dart';
import 'package:test_bloc/config/print_color.dart';


class FetchApi {
  FetchApi._();
  static Future<Map> getWeather(String viDo, String kinhDo) async {
    var uri = Uri.https(AppApi.baseApi, AppApi.data, {
      AppApi.lat: viDo,
      AppApi.lon: kinhDo,
      AppApi.appId: AppApi.apiKey,
      AppApi.units: AppApi.metric
    });
    Map result = {};
    try {
      final response = await http.get(uri);

      switch (response.statusCode) {
        case 200:
          var data = jsonDecode(response.body);
          result = data;
          break;
        case 400:
          var data = jsonDecode(response.body);
          result = data;
          break;
        case 401:
          var data = jsonDecode(response.body);
          result = data;
          break;
        case 404:
          var data = jsonDecode(response.body);
          result = data;

          break;
        default:
      }

      return result;
    } catch (e) {
      printRed(e.toString());
    }
    return result;
  }
}
