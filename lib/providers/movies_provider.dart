import 'dart:convert';
import 'package:lati_marvel/models/movie_model.dart';
import 'package:lati_marvel/providers/base_provider.dart';



class MoviesProvider extends BaseProvider {
  List<MovieModel> Movies = [];
  Future<void> fetchMovies() async {
    setBusy(true);

    final response =
        await api.getRequset("https://mcuapi.herokuapp.com/api/v1/movies");

    if (response.statusCode == 200) {
      var decodeData = json.decode(response.body)['data'];
      for (var x in decodeData) {
        Movies.add(MovieModel.fromJson(x));
      }
    }
    setBusy(false);
  }
}
