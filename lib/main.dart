import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:solve_the_story/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Game Ngobrol',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   HomePage.route: (context) => const HomePage(),
      //   SolveStoryPage.route: (context) =>  SolveStoryPage(),
      //   ChooseStoryPage.route: (context) => const ChooseStoryPage(),
      // },
      home: const HomePage(),
    );
  }
}
