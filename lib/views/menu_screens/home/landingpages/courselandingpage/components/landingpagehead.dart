import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_card/main_menu_providers.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class LandingPageHead extends StatelessWidget {
  final String? img;

  const LandingPageHead({
    super.key,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProviders>(
      builder: (context, menu, child) {
        return Container(
            height: 265.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(),
            child: img == null
                ? Image.asset(
                    AppImages.applogo,
                    fit: BoxFit.cover,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context, url) =>
                            LoadingAnimationWidget.fallingDot(
                                color: AppColors.primarybrown, size: 25.h),
                        imageUrl: img!),
                  ));
      },
    );
  }
}
