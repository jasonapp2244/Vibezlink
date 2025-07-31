import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxmvvm/resources/colors/app_colors.dart';

class CustomProfileCard extends StatelessWidget {
  final String profileImagePath;
  final String name;
  final String role;
  final VoidCallback? onFollowTap;
  final VoidCallback? onCloseTap;

  const CustomProfileCard({
    Key? key,
    required this.profileImagePath,
    required this.name,
    required this.role,
    this.onFollowTap,
    this.onCloseTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 195.h,

      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.borderCardColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close Icon
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onCloseTap,
              child: Icon(Icons.close, size: 16.sp, color: Color(0xff1D1919)),
            ),
          ),

          // Profile Picture
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(profileImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),

          // Name
          Text(
            name,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),

          // Role
          Text(
            role,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),

          // Follow Button
          GestureDetector(
            onTap: onFollowTap,
            child: Container(
              width: 114.w,
              height: 28.h,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                gradient: AppColors.followButtonGradient,
              ),
              child: Center(
                child: Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
