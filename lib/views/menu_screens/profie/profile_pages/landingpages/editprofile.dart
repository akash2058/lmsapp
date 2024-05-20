import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customsmallbutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/utilities/textvalidation.dart';
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
    loaddata();
  }

  void loaddata() {
    var state = Provider.of<MenuProviders>(context, listen: false);
    state.loadeditprofileData();
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, profile, child) {
        return Scaffold(
          appBar: CustomAppbar(autoapply: true, title: 'Edit Profile'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ProflleImage(
                            child: profile.selectedimage != null
                                ? Image.file(
                                    fit: BoxFit.cover, profile.selectedimage!)
                                : Container(
                                    height: 65.h,
                                    width: 65.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                '${profile.profile?.data?.baseurl}/${profile.profile?.data?.photo}'))),
                                    child: child,
                                  )),
                        Column(
                          children: [
                            CustomSmallButton(
                                textcolor: AppColors.primarywhite,
                                backgroudcolor: AppColors.primarybrown,
                                height: 40.h,
                                text: 'Upload Photo',
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actionsAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          title: Center(
                                              child: Text(
                                            'Choose One',
                                            style: titlestyle,
                                          )),
                                          actions: [
                                            GestureDetector(
                                              onTap: () {
                                                profile
                                                    .pickimageanduploadfromcamera(
                                                        context);
                                              },
                                              child: Column(
                                                children: [
                                                  const Icon(
                                                    Icons.camera,
                                                    color:
                                                        AppColors.primarybrown,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Text(
                                                    'Camera',
                                                    style: titlestyle,
                                                  )
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                profile
                                                    .pickImageAndUploadfromGallery(
                                                        context);
                                              },
                                              child: Column(
                                                children: [
                                                  const Icon(
                                                    Icons.image,
                                                    color:
                                                        AppColors.primarybrown,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Text(
                                                    'Image',
                                                    style: titlestyle,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                })
                          ],
                        )
                      ],
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
                        validation: validatename,
                        controller: profile.namecontroller,
                        hint: 'Enter Full Name'),
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
                        validation: validatephonenumber,
                        controller: profile.phonenumbercontroller,
                        hint: 'Enter Phone Number'),
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
                        validation: validateEmail,
                        controller: profile.emailcontroller,
                        hint: 'Enter Email'),
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
                                  controller: profile.dobcontroller,
                                  validation: validatedob,
                                  ontap: () {
                                    profile.selectDate(context);
                                  },
                                  hint:
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
                                  validation: validatecountry,
                                  controller: profile.countrycontroller,
                                  hint: 'Country')
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
                    GooglePlacesAutoCompleteTextFormField(
                        validator: validateaddress,
                        decoration: InputDecoration(
                            hintStyle: hinttextstyle,
                            errorStyle: paymentpricestyle,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 14.h),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: AppColors.primarylightgrey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: AppColors.primarylightgrey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: AppColors.primarylightgrey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: AppColors.primarylightgrey),
                            ),
                            hintText: 'Enter Your Permanent address'),
                        style: formfieldstyle,
                        textEditingController: profile.addresscontroller,
                        googleAPIKey: "AIzaSyAldFf3OU4nVwg21S7bIVdwPExCf8sJsEg",
                        debounceTime: 400, // Adjust debounce time as needed
                        // Optional countries parameter

                        isLatLngRequired: true,
                        getPlaceDetailWithLatLng: (prediction) {},
                        // Callback to handle user selection from suggestions
                        itmClick: (prediction) {
                          profile.addresscontroller.text =
                              prediction.description.toString();
                          profile.addresscontroller.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: prediction.description!.length));
                        }),
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
                                  validation: validatecity,
                                  controller: profile.citycontroller,
                                  hint: 'City')
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
                                'State',
                                style: reviewtitlestyle,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              CustomFormField(
                                  validation: validatestate,
                                  controller: profile.provincecontroller,
                                  hint: 'state')
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
                                  validation: validatepostalcode,
                                  controller: profile.postalcodecontroller,
                                  hint: 'postal code')
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
                            : 'Save',
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            profile.geteditprofile(context);
                          }
                        }),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
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
  Widget? child;
  ProflleImage({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 65.w,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: AppColors.primarywhite),
      child: child,
    );
  }
}
