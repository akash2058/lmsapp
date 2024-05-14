import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:provider/provider.dart';

class EditProfille extends StatefulWidget {
  const EditProfille({super.key});

  @override
  State<EditProfille> createState() => _EditProfilleState();
}

class _EditProfilleState extends State<EditProfille> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profiledata();
    });
  }

  profiledata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    state.namecontroller.clear();
    state.emailcontroller.clear();
    state.countrycontroller.clear();
    state.addresscontroller.clear();
    state.phonenumbercontroller.clear();
    state.provincecontroller.clear();
    state.citycontroller.clear();
    state.provincecontroller.clear();
    state.postalcodecontroller.clear();
    await state.getMyProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, profile, child) {
        return Scaffold(
          appBar: CustomAppbar(autoapply: true, title: 'Edit Profile'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
              child: profile.loadinggetprofile == true
                  ? const Center(
                      child: LinearProgressIndicator(
                      color: AppColors.primarybrown,
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProflleImage(
                          img:
                              '${profile.profile?.data?.baseurl}/${profile.profile?.data?.photo}',
                        ),
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
                        CustomFormField(
                            controller: profile.namecontroller,
                            hint: profile.profile?.data?.name.toString() ??
                                'Enter Full Name'),
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
                        CustomFormField(
                            controller: profile.phonenumbercontroller,
                            hint: profile.profile?.data?.phone.toString() ??
                                'Enter Phone Number'),
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
                        CustomFormField(
                            controller: profile.emailcontroller,
                            hint: profile.profile?.data?.email.toString() ??
                                'Enter Email'),
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
                                  CustomFormField(
                                      ontap: () {
                                        profile.selectDate(context);
                                      },
                                      hint: profile.profile?.data?.dob
                                              .toString() ??
                                          '${profile.selectdate.year}-${profile.selectdate.month}-${profile.selectdate.day}'),
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
                                    'Country',
                                    style: reviewtitlestyle,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  CustomFormField(
                                      controller: profile.countrycontroller,
                                      hint: profile.profile?.data?.country
                                              .toString() ??
                                          'Country')
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
                        CustomFormField(
                            controller: profile.addresscontroller,
                            hint: profile.profile?.data?.address.toString() ??
                                'Enter Permanent Address'),
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
                                  CustomFormField(
                                      controller: profile.citycontroller,
                                      hint: profile.profile?.data?.city
                                              .toString() ??
                                          'City')
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
                                  CustomFormField(
                                      controller: profile.provincecontroller,
                                      hint: profile.profile?.data?.state
                                              .toString() ??
                                          'province')
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
                                  CustomFormField(
                                      controller: profile.postalcodecontroller,
                                      hint: profile.profile?.data?.postcode
                                              .toString() ??
                                          'postal code')
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomButton(
                            height: 53.h,
                            text: profile.loadingprofiledit == true
                                ? 'Please Wait....'
                                : 'Edit Profile',
                            onTap: () {
                              var state = Provider.of<AuthenticationProvider>(
                                  context,
                                  listen: false);
                              profile.geteditprofile(context);
                            }),
                        SizedBox(
                          height: 25.h,
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

// ignore: must_be_immutable
class ProflleImage extends StatelessWidget {
  String img;
  ProflleImage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 65.w,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img)),
          shape: BoxShape.circle,
          color: AppColors.primarybrown),
    );
  }
}
