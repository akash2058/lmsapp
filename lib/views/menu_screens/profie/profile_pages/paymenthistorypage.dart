import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';

import 'package:lmsapp/views/menu_screens/profie/components/paymenthistorypagecard.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/landingpages/paymentcourselandingpage.dart';
import 'package:provider/provider.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadpaymentdata();
    });
  }

  void loadpaymentdata() async {
    var state = Provider.of<MenuProviders>(context, listen: false);
    await state.getpayment();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: AppColors.primarywhite,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  CustomButton(
                    width: MediaQuery.sizeOf(context).width,
                    height: 53.h,
                    text: 'Back to Homepage',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          appBar: CustomAppbar(autoapply: true, title: 'Payment History'),
          body: value.loadingpayment == true
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
                  child: Column(
                      children: List.generate(
                          value.payment?.data?.payments?.length ?? 0, (index) {
                    var data = value.payment?.data?.payments?[index];
                    return Column(
                      children: [
                        PaymentHistoryCard(
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: const PaymentCourseLandingPage()));
                          },
                          coursetitle: data?.courseTitle ?? '',
                          date: '',
                          price: 'INR${data?.salePrice ?? ''}',
                          time: data?.createdAt ?? '',
                          img:
                              '${value.payment?.data?.baseUrl}/${data?.courseImage}',
                        ),
                        SizedBox(
                          height: 24.h,
                        )
                      ],
                    );
                  })),
                ),
        );
      },
    );
  }
}
