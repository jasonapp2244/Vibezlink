import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:getxmvvm/resources/colors/app_colors.dart';

class BottomNavigationWithImages extends StatefulWidget {
  const BottomNavigationWithImages({super.key});

  @override
  State<BottomNavigationWithImages> createState() => _BottomNavigationWithImagesState();
}

class _BottomNavigationWithImagesState extends State<BottomNavigationWithImages> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Page $_selectedIndex'),
        ),
      ),
      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.white, // White text for gradient background
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.transparent, // Transparent when using gradient
        color: Colors.black,
        tabs: [
          GButton(
            text: 'Home',
            leading: SvgPicture.asset(
              'assets/icons/appbar_logo.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          ),
          GButton(
            text: 'Likes',
            leading: SvgPicture.asset(
              'assets/icons/notification.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          ),
          GButton(
            text: 'Search',
            leading: SvgPicture.asset(
              'assets/icons/searchfill.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          ),
          GButton(
            text: 'Profile',
            leading: SvgPicture.asset(
              'assets/icons/menu.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
} 