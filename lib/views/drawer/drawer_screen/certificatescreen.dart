import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/drawer/drawer_screen/components/certificatewebview.dart';
import 'package:lmsapp/views/drawer/drawer_screen/controller/drawercontroller.dart';
import 'package:provider/provider.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadcertificate();
    });
  }

  void loadcertificate() async {
    var state = Provider.of<DrawerProvider>(context, listen: false);
    await state.getCertificate();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, drawer, child) {
        return Scaffold(
          appBar: CustomAppbar(
              autoapply: true,
              actions: [
                const Icon(Icons.more_horiz),
                SizedBox(
                  width: 20.w,
                )
              ],
              title: 'Certificates'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(drawer.certificate?.data?.length ?? 0,
                      (index) {
                var data = drawer.certificate?.data?[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: AppColors.primarylowlightdark)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(AppImages.certificate)),
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data?.cerificateTitle ?? '',
                                style: titlestyle,
                              ),
                              Text(
                                'Pass: ${data?.isPass ?? ''}',
                                style: editprofilefont,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: CertificateWebView(
                                        url: data?.link.toString() ?? '',
                                        title: data?.cerificateTitle ?? '')));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: AppColors.primarybrown,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              'View Certificate',
                              style: allCoursetitle,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })),
            ),
          ),
        );
      },
    );
  }
}
