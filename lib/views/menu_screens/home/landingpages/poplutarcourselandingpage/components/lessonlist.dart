import 'package:flutter/material.dart';
import 'package:lmsapp/customwidgets/customtile.dart';
import 'package:lmsapp/utilities/textstyle.dart';


class LessonLists extends StatelessWidget {
  const LessonLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          2,
          (index) => Card(
              child: CustomTile(
                  // ignore: prefer_const_constructors
                  trailing: Icon(Icons.lock_open_outlined),
                  leading: Text(
                    '01',
                    style: lessonnumfont,
                  ),
                  title: 'What is FrameWork',
                  subtitle: '5min 20 sec'))),
    );
  }
}
