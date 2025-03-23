// import 'package:flutter/material.dart';

// class CardGrid extends StatelessWidget {
//   const CardGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: EdgeInsets.all(8),
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         childAspectRatio: 1 / 1,
//         crossAxisCount: 2,
//         // crossAxisSpacing: 8,
//         mainAxisSpacing: 4,
//       ),
//       itemCount: storyProvider.allStories.length,
//       itemBuilder: (context, index) {
//         final story = storyProvider.allStories[index];
//         final done = isStoryDone(story, doneStoriesJson);
//         return StoryCardButton(
//           isDone: done,
//           image: "assets/images/object1.png",
//           bgColor:
//               randomColors[int.parse(storyProvider.allStories[index].color)],
//           text: storyProvider.allStories[index].titleEn.toString(),
//           subText: '15 Stories, about what yaa.',
//           isLocked: false,
//           isDark: true,
//           onTap: () {
//             Get.to(
//               () => StoryQuestionPage(
//                 storyIndex: index,
//               ),
//               transition: Transition.cupertino,
//               duration: const Duration(
//                 milliseconds: 800,
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
