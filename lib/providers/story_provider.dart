import 'package:flutter/material.dart';
import 'package:solve_the_story/api/api_service.dart';
import 'package:solve_the_story/models/story_model.dart';

enum ResultState { Loading, NoData, HasData, Error }

class StoryProvider extends ChangeNotifier {
  StoryProvider() {
    fetchAllStories();
  }

  List<Story> allStories = [];

  Future<dynamic> fetchAllStories() async {
    allStories = await ApiService.getAllStories();
    notifyListeners();
  }
}
