import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';

class EditProfille extends StatelessWidget {
  const EditProfille({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(autoapply: true, title: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProflleImage(),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Basic Information*',
                style: titleStyle,
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                'Full Name',
                style: reviewtitlestyle,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomFormField(hint: 'Enter Full Name'),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Phone Number',
                style: reviewtitlestyle,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomFormField(hint: 'Enter Phone Number'),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Email',
                style: reviewtitlestyle,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomFormField(hint: 'Enter Email'),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Of Birth',
                          style: reviewtitlestyle,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 14.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: AppColors.primarylightgrey)),
                          child: Row(
                            children: [
                              Text(
                                'Choose',
                                style: itemsfont,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(child: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: reviewtitlestyle,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 14.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: AppColors.primarylightgrey)),
                          child: Row(
                            children: [
                              Text(
                                'Choose',
                                style: itemsfont,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(child: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nationality',
                          style: reviewtitlestyle,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 14.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: AppColors.primarylightgrey)),
                          child: Row(
                            children: [
                              Text(
                                'Choose',
                                style: itemsfont,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(child: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Permanent Address',
                style: reviewtitlestyle,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomFormField(hint: 'Enter Permanent Address'),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City',
                          style: reviewtitlestyle,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 14.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: AppColors.primarylightgrey)),
                          child: Row(
                            children: [
                              Text(
                                'Choose',
                                style: itemsfont,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(child: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Province',
                          style: reviewtitlestyle,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 14.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: AppColors.primarylightgrey)),
                          child: Row(
                            children: [
                              Text(
                                'Choose',
                                style: itemsfont,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(child: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Postal Code',
                          style: reviewtitlestyle,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.5.w, vertical: 14.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: AppColors.primarylightgrey)),
                          child: Row(
                            children: [
                              Text(
                                'Choose',
                                style: itemsfont,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(child: Icon(Icons.arrow_drop_down))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProflleImage extends StatelessWidget {
  const ProflleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: 70.w,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 65.h,
            width: 65.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(AppImages.imgone))),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primarybrown,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(4.sp),
            child: Icon(
              Icons.add,
              size: 14.h,
              color: AppColors.primarywhite,
            ),
          ),
        ],
      ),
    );
  }
}
