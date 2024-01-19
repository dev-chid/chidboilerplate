import 'package:http/http.dart' as http;

class ExampleDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    const openWeatherAPIKey = '7985e61e7888063819ffe69a391dfedb';
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$openWeatherAPIKey',
        ),
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
