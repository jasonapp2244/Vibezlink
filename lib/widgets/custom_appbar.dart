import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Appbar Logo
            Image.asset('assets/icons/logo.png'),

            // Notification & Menu Icons
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle notification tap
                  },
                  child: SvgPicture.asset('assets/icons/notification.svg'),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Handle menu tap
                  },
                  child: SvgPicture.asset('assets/icons/menu.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Customize height
}
