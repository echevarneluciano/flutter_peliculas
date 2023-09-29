import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_peliculas/models/now_playing_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '68b8d71d4c7183b45427dd76cd7f03f9';
  final String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    if (response.statusCode == 200) {
      print(nowPlayingResponse.results[0].originalTitle);
    }
  }
}
