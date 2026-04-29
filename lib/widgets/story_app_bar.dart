import 'package:flutter/material.dart';
import 'package:solve_the_story/styles.dart';
import 'package:solve_the_story/widgets/audio_toggle.dart';
import 'package:solve_the_story/widgets/show_modal_story.dart';

class StoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isSliver;

  const StoryAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isSliver) {
      return SliverAppBar(
        floating: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: leading,
        centerTitle: true,
        title: _titleWidget(),
        actions: _actionsWidget(context),
      );
    }

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leading,
      centerTitle: true,
      title: _titleWidget(),
      actions: _actionsWidget(context),
    );
  }

  Widget _titleWidget() {
    return Text(
      title,
      style: fancyText.copyWith(
        color: primaryLight,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 2,
      ),
    );
  }

  List<Widget> _actionsWidget(BuildContext context) {
    return [
      if (actions != null) ...actions!,
      const AudioToggle(),
      IconButton(
        icon: const Icon(Icons.info_outline),
        color: primaryLight,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => ShowModalStory(),
          );
        },
      ),
      const SizedBox(width: 8),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
