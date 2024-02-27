import 'package:dll_movil/models/Jokes.dart';

void main(List<String> args) async {
  Jokes jokes = Jokes();
  Map<String, dynamic> json = await jokes.obtenerJoke();
  jokes = Jokes.fromJson(json);
  print(jokes);
}