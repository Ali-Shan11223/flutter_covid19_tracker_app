import 'dart:convert';

import 'package:flutter_covid19_tracker/model/world_states_model.dart';
import 'package:flutter_covid19_tracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> getWorldStates() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
