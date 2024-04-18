import 'package:flutter/cupertino.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/components/customtlessontile.dart';

class LessonLists extends StatelessWidget {
  const LessonLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (index) => CustomLessonTile(
                lessonno: '01',
                duration: '5min 34s',
                lessontitle: 'Introducing to The Class',
              )),
    );
  }
}
