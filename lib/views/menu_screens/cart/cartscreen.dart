import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/customwidgets/%20customitemdiscount.dart';

import 'package:lmsapp/customwidgets/customappbar.dart';
import 'package:lmsapp/customwidgets/custombutton.dart';
import 'package:lmsapp/customwidgets/customitemprice.dart';
import 'package:lmsapp/customwidgets/custompaymentcard.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/customwidgets/customsmallbutton.dart';
import 'package:lmsapp/customwidgets/customtextformfield.dart';
import 'package:lmsapp/utilities/textstyle.dart';
import 'package:lmsapp/views/authentication_pages/authentication_controller.dart';
import 'package:lmsapp/views/menu_screens/cart/cart_provider/cart_provider.dart';
import 'package:lmsapp/views/menu_screens/cart/checkoutpage/checkoutpage.dart';
import 'package:lmsapp/views/menu_screens/cart/components/coursecartcard.dart';
import 'package:lmsapp/views/menu_screens/home/landingpages/poplutarcourselandingpage/popularcourselandingpage.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getcartdata();
    });
  }

  Future<void> getcartdata() async {
    var state = Provider.of<CartProvider>(context, listen: false);
    state.getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        var state = Provider.of<AuthenticationProvider>(context, listen: false);
        return Scaffold(
          appBar: CustomAppbar(
            autoapply: true,
            title: 'Cart',
            actions: [
              Icon(
                Icons.more_horiz,
                size: 24.h,
              ),
              SizedBox(
                width: 21.w,
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 15.h),
            child: cart.loadinggetcart == true
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: getcartdata,
                          child: cart.cart?.data?.cartItems?.isEmpty ?? true
                              ? Center(
                                  child: Text(
                                  'No Cart Items !!!',
                                  style: pricestyle,
                                ))
                              : ListView.builder(
                                  itemCount:
                                      cart.cart?.data?.cartItems?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    var data =
                                        cart.cart?.data?.cartItems?[index];
                                    return Column(
                                      children: [
                                        CartCard(
                                          ontapicon: () async {
                                            // Save the context
                                            BuildContext dialogContext =
                                                context;
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Are You Sure Do You Want Delete ?',
                                                    style: titlestyle,
                                                  ),
                                                  actions: [
                                                    CustomSmallButton(
                                                      text: 'No',
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    CustomSmallButton(
                                                      text: 'Yes',
                                                      onTap: () {
                                                        Navigator.pop(
                                                            dialogContext);
                                                        cart.getremovecart(
                                                            data?.id.toString() ??
                                                                '',
                                                            dialogContext,
                                                            index);
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          ontap: () {
                                            Navigator.push(
                                              context,
                                              CustomPageRoute(
                                                child: PopularCourseLandingPage(
                                                  id: data?.courseId
                                                          .toString() ??
                                                      '',
                                                ),
                                              ),
                                            );
                                          },
                                          coursetitle: data?.courseTitle ?? '',
                                          price: '₹${data?.coursePrice}',
                                          title: data?.courseTitle ?? '',
                                          img:
                                              '${cart.cart?.data?.imageBaseUrl}/${data?.courseImage}',
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        )
                                      ],
                                    );
                                  },
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomFormField(hint: 'Coupon Code'),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                  child: CustomButton(
                                      height: 53.h,
                                      text: 'Apply',
                                      onTap: () {}))
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomItemsPrice(
                              amount: '${cart.cartItems}', items: 'items'),
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomItemDiscount(
                              discount: 'Discount Price ',
                              discountpercent:
                                  '₹${cart.cart?.data?.afterDiscountPrice ?? ''}')
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        children: [
                          CustomPaymentCard(
                              amount: '₹${cart.cart?.data?.totalPrice ?? ''}'),
                          SizedBox(
                            height: 13.h,
                          ),
                          CustomButton(
                              height: 53.h,
                              text: 'CheckOut',
                              onTap: () {
                                if (cart.cart?.data?.cartItems?.isEmpty ??
                                    true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Cart is Empty',
                                        style: pricestyle,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    CustomPageRoute(
                                      child: CheckOutPage(
                                        id: state.userid.toString(),
                                      ),
                                    ),
                                  );
                                }
                              })
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
