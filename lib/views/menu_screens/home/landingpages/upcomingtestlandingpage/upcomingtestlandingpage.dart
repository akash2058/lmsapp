import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customsmallbutton.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:provider/provider.dart';

class UpComingTestLandingpage extends StatefulWidget {
  final String quizid;
  final String title;
  const UpComingTestLandingpage(
      {super.key, required this.quizid, required this.title});

  @override
  State<UpComingTestLandingpage> createState() =>
      _UpComingTestLandingpageState();
}

class _UpComingTestLandingpageState extends State<UpComingTestLandingpage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loaddata();
    });
  }

  void loaddata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    await state.getStartQuiz(widget.quizid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Scaffold(
          appBar: CustomAppbar(autoapply: true, title: widget.title),
          body: main.loadingstartquiz == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            main.quiztest?.data?.allQuestions?.length ?? 0,
                            (index) {
                          var question =
                              main.quiztest?.data?.allQuestions?[index];
                          return Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(20),
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: AppColors.primaryacent,
                                  ),
                                  child: Center(
                                    child: Text('${question?.title}'),
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              Column(
                                children: List.generate(
                                    main.quiztest?.data?.allQuestions?[index]
                                            .answers?.length ??
                                        0, (index) {
                                  var answer = question?.answers?[index];
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.formfillcolor),
                                        padding: EdgeInsets.all(10.sp),
                                        child: Center(
                                            child: Row(
                                          children: [
                                            Text('Q${index + 1}'),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Flexible(
                                                child:
                                                    Text('${answer?.answer}')),
                                          ],
                                        )),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      )
                                    ],
                                  );
                                }),
                              ),
                              SizedBox(
                                height: 20.h,
                              )
                            ],
                          );
                        })),
                  ),
                ),
        );
      },
    );
  }
}

// class QuizCard extends StatelessWidget {
//   const QuizCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10.h),
//       width: MediaQuery.sizeOf(context).width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.r),
//         border: Border.all(
//           width: 1.sp,
//           color: AppColors.primarygrey,
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'UI/UX Design',
//                 style: titlestyle,
//               ),
//               SizedBox(
//                 height: 4.h,
//               ),
//               Text(
//                 '10 Questions | 20 Marks | 10 Mins',
//                 style: itemsfont,
//               )
//             ],
//           ),
//           CustomSmallButton(
//               backgroudcolor: AppColors.primarybrown,
//               textcolor: AppColors.primarywhite,
//               text: 'Start',
//               onTap: () {})
//         ],
//       ),
//     );
//   }
// }

// class LatestQuizetitle extends StatelessWidget {
//   const LatestQuizetitle({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'Latest Quizes',
//           style: titleStyle,
//         ),
//         Text(
//           'See all',
//           style: pricestyle,
//         )
//       ],
//     );
//   }
// }

// class TestLists extends StatelessWidget {
//   const TestLists({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//             3,
//             (index) => Row(
//                   children: [
//                     TestCard(
//                       testtitle: 'Mockup Test',
//                       duration: '0',
//                     ),
//                     SizedBox(
//                       width: 17.w,
//                     ),
//                   ],
//                 )),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class TestCard extends StatelessWidget {
//   String testtitle;
//   String duration;
//   TestCard({super.key, required this.testtitle, required this.duration});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 112.61.w,
//       padding: EdgeInsets.symmetric(horizontal: 15.18.w, vertical: 18.98.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.r),
//         border: Border.all(width: 1.5.w, color: AppColors.primarygrey),
//       ),
//       child: Column(
//         children: [
//           Container(
//             height: 74.h,
//             width: 74.w,
//             decoration: const BoxDecoration(
//                 color: AppColors.formfillcolor, shape: BoxShape.circle),
//           ),
//           SizedBox(
//             height: 18.h,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             testtitle,
//             style: testtitlestyle,
//           ),
//           SizedBox(
//             height: 15.h,
//           ),
//           Text(
//             '$duration/20',
//             style: testnumberstyle,
//           )
//         ],
//       ),
//     );
//   }
// }
