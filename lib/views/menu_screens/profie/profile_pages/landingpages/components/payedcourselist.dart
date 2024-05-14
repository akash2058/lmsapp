import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customexpansiontile.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/customlessontext.dart';

class PayedCourseLandingPage extends StatelessWidget {
  const PayedCourseLandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => CustomExpansionTile(
          lessonnum: '01',
          duration: '5min 34s',
          lessontitle: 'Introduction to the Class',
          children: [
            Customlessontext(
              title:
                  'Course Introduction - AWS Certified Solutions Architect Associate',
            ),
            SizedBox(
              height: 10.h,
            ),
            Customlessondetails(
                title:
                    'Please Read Lectures carefully Please Read Lectures carefullyPlease Read Lectures carefully'),
          ],
        ),
      ),
    );
  }
}
