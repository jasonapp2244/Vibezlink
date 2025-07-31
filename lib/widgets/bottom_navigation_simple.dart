import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationSimple extends StatefulWidget {
  const BottomNavigationSimple({super.key});

  @override
  State<BottomNavigationSimple> createState() => _BottomNavigationSimpleState();
}

class _BottomNavigationSimpleState extends State<BottomNavigationSimple> {
  int _selectedIndex = 0;

  // Data structure for navigation items
  final List<Map<String, String>> navigationItems = [
    {
      'text': 'Home',
      'imagePath': 'assets/icons/appbar_logo.svg',
    },
    {
      'text': 'Likes',
      'imagePath': 'assets/icons/notification.svg',
    },
    {
      'text': 'Search',
      'imagePath': 'assets/icons/searchfill.svg',
    },
    {
      'text': 'Profile',
      'imagePath': 'assets/icons/menu.svg',
    },
  ];

  // Build image widget based on file extension
  Widget _buildImageWidget(String imagePath, int index) {
    if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          _selectedIndex == index ? Colors.white : Colors.black,
          BlendMode.srcIn,
        ),
      );
    } else {
      return Image.asset(
        imagePath,
        width: 24,
        height: 24,
        color: _selectedIndex == index ? Colors.white : Colors.black,
      );
    }
  }

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
        activeColor: Colors.white,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.transparent,
        color: Colors.black,
        tabs: navigationItems.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, String> item = entry.value;
          
          return GButton(
            text: item['text']!,
            leading: _buildImageWidget(item['imagePath']!, index),
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          );
        }).toList(),
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