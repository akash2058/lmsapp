import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/bottom_sheet/components/gategorybuttonlist.dart';
import 'package:lmsapp/views/bottom_sheet/components/searchbyratinglist.dart';
import 'package:lmsapp/views/bottom_sheet/provider/bottomsheetprovider.dart';
import 'package:lmsapp/views/coursesearchpage/course_search_page.dart';
import 'package:provider/provider.dart';

class LmsBottomSheet extends StatefulWidget {
  const LmsBottomSheet({super.key});

  @override
  State<LmsBottomSheet> createState() => _LmsBottomSheetState();
}

class _LmsBottomSheetState extends State<LmsBottomSheet> {
  RangeValues _currentRangeValues =
      const RangeValues(10000, 90000); // Set initial gap
  final double _minGap = 10000;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadgategory();
    });
  }

  void loadgategory() async {
    var state = Provider.of<BottomsheetProvider>(context, listen: false);
    await state.getGategory();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomsheetProvider>(
      builder: (context, bottom, child) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
            ),
            color: AppColors.primarywhite,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 4.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: AppColors.primarygrey,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                    ),
                  ),
                  Text('Category', style: titlestyle),
                  SizedBox(height: 20.h),
                  const GategoryButtonList(),
                  SizedBox(height: 20.h),
                  Text('Search By', style: titlestyle),
                  SizedBox(height: 20.h),
                  CustomFormField(
                    controller: bottom.searchbycontroller,
                    hint: '',
                  ),
                  SizedBox(height: 20.h),
                  Text('Search By', style: titlestyle),
                  SizedBox(height: 20.h),
                  const SearchByRatings(),
                  SizedBox(height: 20.h),
                  Text('Price', style: titlestyle),
                  SizedBox(height: 20.h),

                  // Range slider with gap logic
                  RangeSlider(
                    activeColor: AppColors.primarybrown,
                    values: _currentRangeValues,
                    min: 0,
                    max: 100000,
                    divisions: 100,
                    labels: RangeLabels(
                      '₹${_currentRangeValues.start.round()}',
                      '₹${_currentRangeValues.end.round()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        // Ensure the gap between start and end values
                        if ((values.end - values.start) >= _minGap) {
                          _currentRangeValues = values;
                          bottom.coursestartrprice.text =
                              _currentRangeValues.start.round().toString();
                          bottom.courseendprice.text =
                              _currentRangeValues.end.round().toString();
                        } else {
                          // Maintain the gap if user tries to bring sliders too close
                          if (_currentRangeValues.start != values.start) {
                            _currentRangeValues = RangeValues(
                              values.start,
                              values.start + _minGap,
                            );
                          } else {
                            _currentRangeValues = RangeValues(
                              values.end - _minGap,
                              values.end,
                            );
                          }
                        }
                      });
                    },
                  ),

                  SizedBox(height: 10.h), // Space between slider and labels

                  // Adjusted price labels with proper spacing between them
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('₹${_currentRangeValues.start.round()}',
                            style: titlestyle),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('₹${_currentRangeValues.end.round()}',
                              style: titlestyle),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  CustomButton(
                    height: 53.h,
                    text: bottom.loadingsearchcourse == true
                        ? 'Searching....'
                        : 'Search',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          CustomPageRoute(child: const CourseSearchPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
