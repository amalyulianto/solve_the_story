import 'package:flutter/material.dart';
import 'package:solve_the_story/api/api_service.dart';
import 'package:solve_the_story/models/story_model.dart';

class StoryProvider extends ChangeNotifier {
  StoryProvider() {
    fetchAllStories();
  }

  List<Story> allStories = [];

  // List<Story> get allStories => _allStories;

  // set allStories(List<Story> value) {
  //   _allStories = value;
  // }

  Future<dynamic> fetchAllStories() async {
    allStories = await ApiService.getAllStories();
    notifyListeners();
  }
}
