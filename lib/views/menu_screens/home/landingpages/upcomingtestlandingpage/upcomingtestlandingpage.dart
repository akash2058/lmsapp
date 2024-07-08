import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
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
    state.selectedAnswers.clear();
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      style: fonts,
    ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, main, child) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            height: 95.h,
            child: CustomButton(
                text: main.loadingsubmit == true ? 'Please Wait....' : 'Submit',
                onTap: () {
                  bool allAnswered = main.quiztest?.data?.allQuestions?.every(
                          (question) => main.selectedAnswers.containsKey(main
                              .quiztest?.data?.allQuestions
                              ?.indexOf(question))) ??
                      false;

                  if (allAnswered) {
                    main.getSubmittest(widget.quizid, context);
                  } else {
                    showSnackbar(context,
                        'Please answer all the questions before submitting');
                  }
                }),
          ),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 12),
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.secondarybrown,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Qno:${index + 1}',
                                          style: allCoursetitle),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Flexible(
                                        child: Text('${question?.title}',
                                            style: allCoursetitle),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              Column(
                                children: List.generate(
                                    main.quiztest?.data?.allQuestions?[index]
                                            .answers?.length ??
                                        0, (answerIndex) {
                                  var answer = question?.answers?[answerIndex];
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          main.selectAnswer(index,
                                              answer?.id.toString() ?? '');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color:
                                                  main.selectedAnswers[index] ==
                                                          answer?.id.toString()
                                                      ? AppColors.primaryacent
                                                      : AppColors
                                                          .formfillcolor),
                                          padding: EdgeInsets.all(10.sp),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Transform.scale(
                                                scale: 0.8,
                                                child: Radio<String>(
                                                  activeColor:
                                                      AppColors.primarywhite,
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  value:
                                                      answer?.id.toString() ??
                                                          '',
                                                  groupValue: main
                                                      .selectedAnswers[index],
                                                  onChanged: (value) {
                                                    main.selectAnswer(
                                                        index, value!);
                                                  },
                                                ),
                                              ),
                                              Text(
                                                '${answerIndex + 1}.',
                                                style: main.selectedAnswers[
                                                            index] ==
                                                        answer?.id.toString()
                                                    ? buttonstyle
                                                    : coursestyle,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Flexible(
                                                  child: Text(
                                                '${answer?.answer}',
                                                style: main.selectedAnswers[
                                                            index] ==
                                                        answer?.id.toString()
                                                    ? buttonstyle
                                                    : coursestyle,
                                              )),
                                            ],
                                          ),
                                        ),
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
