import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/views/menu_screens/home/components/reviewcard.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({
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
              ReviewCard(
                duration: '6 days ago',
                givereview:
                    "Lyn's straight-talking approach always makes the problem easier to tackle. This session helped me la",
                ratings: '4.5',
                studentname: 'Rodolfo Goode',
              ),
              SizedBox(
                width: 16.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
