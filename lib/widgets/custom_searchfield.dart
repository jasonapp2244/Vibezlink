import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getxmvvm/resources/colors/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? imagePath;

  const CustomSearchField({
    Key? key,
    this.hintText = 'Search by event name, tag, or host',
    this.onChanged,
    this.controller,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.subHeadingColor),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: SvgPicture.asset(
            imagePath ?? 'assets/icons/searchfill.svg',
            width: 20.w,
            height: 20.h,
          ),
        ),
        filled: true,
        fillColor: AppColors.fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
