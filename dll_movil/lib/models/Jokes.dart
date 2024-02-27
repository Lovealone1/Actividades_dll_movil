import 'package:http/http.dart' as http;
import 'dart:convert';

class Jokes {
  late String id;
  late String jokeUrl; // Cambié el nombre de la variable para evitar confusión
  late String value;

  Jokes();

  Jokes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jokeUrl = json['url'];
    value = json['value'];
  }
  Future<Map<String, dynamic>> obtenerJoke() async {
    var url = Uri.parse("https://api.chucknorris.io/jokes/random");
    Future<http.Response> futureResponse = http.get(url);
    http.Response response = await futureResponse;
    Map<String, dynamic> responseData =
        jsonDecode(response.body) as Map<String, dynamic>;
    return responseData;
  }

  @override
  String toString() {
    return 'id: $id, url: $jokeUrl, value: $value';
  }

}