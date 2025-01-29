import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solve_the_story/services/api_service.dart';
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

  Future<void> fetchAllStories(int id) async {
    try {
      allStories = await ApiService.getAllStories(id);
      await _loadDoneStories();
      notifyListeners();
    } catch (error) {
      errorMessage = 'Error fetching stories: $error';
      notifyListeners();
    }
  }

  Future<void> _loadDoneStories() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? doneStoriesJson = prefs.getStringList('doneStories') ?? [];
    for (var storyJson in doneStoriesJson) {
      var doneStory = Story.fromJson(jsonDecode(storyJson));
      var story = allStories.firstWhere(
        (s) => s.id == doneStory.id,
      );
      if (story != null) {
        story.isDone = true;
      }
    }
  }

  Future<void> toggleIsDone(Story story) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? doneStoriesJson = prefs.getStringList('doneStories') ?? [];
    String storyJson = jsonEncode(story.toJson());

    if (doneStoriesJson.contains(storyJson)) {
      doneStoriesJson.remove(storyJson);
      story.isDone = false;
    } else {
      doneStoriesJson.add(storyJson);
      story.isDone = true;
    }

    await prefs.setStringList('doneStories', doneStoriesJson);
    notifyListeners();
  }
}
