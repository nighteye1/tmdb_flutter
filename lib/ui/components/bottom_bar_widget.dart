import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb_app/ui/components/poppins_style.dart';
import 'package:tmdb_app/utils/app_colors.dart';

Widget getBottomBarWidget({
  required int index,
  required String svgImage,
  required String tabText,
  void Function()? onTap,
  required int selectedIndex,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgImage,
            color: selectedIndex == index ? Colors.white : AppColors.lightGrey,
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            tabText,
            style: poppinsStyle(
              fSize: 10.sp,
              fWeight: FontWeight.w700,
              fColor:
                  selectedIndex == index ? Colors.white : AppColors.lightGrey,
            ),
          ),
        ],
      ),
    ),
  );
}
