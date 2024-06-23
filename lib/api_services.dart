import 'dart:convert';

import 'package:untitled6/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Postmodel?> loginwithModel(String emaildata, String passworddata) async {
    try {
      var url = Uri.parse("https://reqres.in/api/login");
      var response =
      await http.post(url, body: {'email': emaildata, 'password': passworddata});
      if (response.statusCode == 200) {
        Postmodel model = Postmodel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
