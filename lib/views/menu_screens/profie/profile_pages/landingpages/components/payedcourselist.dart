import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customexpansiontile.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/components/customlessontext.dart';
import 'package:provider/provider.dart';

class PayedCourseLandingPage extends StatelessWidget {
  const PayedCourseLandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Column(
          children:
              List.generate(main.course?.data?.playlist?.length ?? 0, (index) {
            var data = main.course?.data?.playlist?[index];
            return CustomExpansionTile(
                lessonnum: (index + 1).toString(),
                duration: '${data?.videoContent?[index].duration ?? ''}min',
                lessontitle: data?.title ?? '',
                children: List.generate(
                    main.course?.data?.playlist?[index].videoContent?.length ??
                        0, (index) {
                  var listdata =
                      main.course?.data?.playlist?[index].videoContent?[index];
                  return Column(
                    children: [
                      Customlessontext(
                        title: listdata?.url ?? '',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Customlessondetails(
                          title: listdata?.shortDescription ?? ''),
                    ],
                  );
                }));
          }),
        );
      },
    );
  }
}
