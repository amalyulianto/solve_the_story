import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:solve_the_story/models/story_model.dart';

class ApiService {
  // static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  // static final String _searchUrl =
  //     'https://restaurant-api.dicoding.dev/search?q=';
  // static final String _apiKey = '12345';
  // static final String _list = '/list/';
  // static final String _detail = '/detail/:';
  ApiService._();

  static Future<List<Story>> getAllStories(int i) async {
    String data = await rootBundle.loadString('assets/json/story$i.json');
    var result = json.decode(data) as List;
    return result.map((e) => Story.fromJson(e)).toList().cast<Story>();
  }
}
