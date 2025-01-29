import 'package:flutter/material.dart';
import 'package:solve_the_story/api/api_service.dart';
import 'package:solve_the_story/models/story_model.dart';
import 'package:solve_the_story/providers/id_provider.dart';

class StoryProvider extends ChangeNotifier {
  // StoryProvider() {
  //   fetchAllStories();
  // }

  List<Story> allStories = [];

  // List<Story> get allStories => _allStories;

  // set allStories(List<Story> value) {
  //   _allStories = value;
  // }
  String errorMessage = '';

  Future<void> fetchAllStories(IdProvider idProvider) async {
    try {
      int id = idProvider.currentId;
      allStories = await ApiService.getAllStories(id);
      notifyListeners();
    } catch (error) {
      errorMessage = 'Error fetching stories: $error';
      notifyListeners();
    }
  }
}
