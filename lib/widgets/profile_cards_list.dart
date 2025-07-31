import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxmvvm/widgets/profile_card.dart';


// Data class for profile card information
class ProfileCardData {
  final String profileImagePath;
  final String name;
  final String role;
  final VoidCallback? onFollowTap;
  final VoidCallback? onCloseTap;

  ProfileCardData({
    required this.profileImagePath,
    required this.name,
    required this.role,
    this.onFollowTap,
    this.onCloseTap,
  });
} 