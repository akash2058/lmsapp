import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/home/components/customupcommingtestcard.dart';

class UpComingTestList extends StatelessWidget {
  const UpComingTestList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            3,
            (index) => Row(
                  children: [
                    UpcomingTestCard(
                      duration: '10 Mins',
                      marks: '20 Marks',
                      title: 'UI/UX Design',
                      img: AppImages.uiuximg,
                      questions: '10 Questions',
                    ),
                    SizedBox(
                      width: 14.w,
                    )
                  ],
                )),
      ),
    );
  }
}