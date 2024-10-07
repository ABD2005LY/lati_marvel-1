import 'dart:convert';

import 'package:lati_marvel/models/moviesModel.dart';
import 'package:lati_marvel/providers/baseProvider.dart';

class MoviesProvider extends BaseProvider {
  List<MoviesModel> Movies = [];
  Future<void> fetchMovies() async {
    setBusy(true);

    final response =
        await api.getRequset("https://mcuapi.herokuapp.com/api/v1/movies");

    if (response.statusCode == 200) {
      var decodeData = json.decode(response.body)['data'];
      for (var x in decodeData) {
        Movies.add(MoviesModel.fromJson(x));
      }
    }
    setBusy(false);
  }
}
