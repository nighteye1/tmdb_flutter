import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_app/ui/components/poppins_style.dart';

class AppSearchField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? placeholder;
  final void Function()? onClearTap;
  final void Function(String)? onDoneTap;
  final FocusNode searchNode;
  const AppSearchField({
    super.key,
    required this.controller,
    this.onChange,
    this.placeholder,
    this.onClearTap,
    this.onDoneTap,
    required this.searchNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52.h,
      decoration: BoxDecoration(
        color: const Color(0xFFefefef),
        borderRadius: BorderRadius.circular(30),
      ),
      child: CupertinoTextField(
        autocorrect: false,
        controller: controller,
        focusNode: searchNode,
        textInputAction: TextInputAction.go,
        placeholder: placeholder ?? 'TV shows, movies and more',
        placeholderStyle: poppinsStyle(
          fSize: 14.sp,
          fWeight: FontWeight.w400,
          fColor: const Color(
            0xFF202c43,
          ).withOpacity(0.3),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFefefef),
        ),
        style: poppinsStyle(
          fSize: 14.sp,
          fWeight: FontWeight.w400,
          fColor: const Color(
            0xFF202c43,
          ),
        ),
        prefix: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Icon(
            Icons.search_rounded,
            size: 16.sp,
            color: Colors.black,
          ),
        ),
        suffixMode: OverlayVisibilityMode.editing,
        onChanged: onChange,
        onSubmitted: onDoneTap,
        suffix: GestureDetector(
          onTap: onClearTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Icon(
              Icons.clear,
              size: 16.sp,
              color: const Color(
                0xFF202c43,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
