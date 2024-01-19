// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chidboilerplate/data/data_provider/example_data_provider.dart';
import 'package:chidboilerplate/models/example_model.dart';

class ExampleRepository {
  final ExampleDataProvider exampleDataProvider;
  ExampleRepository(this.exampleDataProvider);

  Future<ExampleModel> getCurrentWeather() async {
    try {
      String cityName = 'india';
      final weatherData = await exampleDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return ExampleModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
