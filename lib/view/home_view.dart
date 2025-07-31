import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getxmvvm/resources/colors/app_colors.dart';
import 'package:getxmvvm/resources/routes/routes.dart';
import 'package:getxmvvm/viewmodel/controller/login/user_prefrence/users_prefrence.dart';
import 'package:getxmvvm/widgets/custom_appbar.dart';
import 'package:getxmvvm/widgets/custom_searchfield.dart';
import 'package:getxmvvm/widgets/custom_upcoming_card.dart';
import 'package:getxmvvm/widgets/profile_card.dart';
import 'package:getxmvvm/widgets/profile_cards_list.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UsersPrefrence usersPrefrence = UsersPrefrence();
  // Create list of profile data
  List<ProfileCardData> profileCards = [
    ProfileCardData(
      profileImagePath: 'assets/images/joncelyn.png',
      name: 'Jocelyn Septimus',
      role: 'Artist',
      onFollowTap: () => print('Followed!'),
      onCloseTap: () => print('Closed!'),
    ),
    ProfileCardData(
      profileImagePath: 'assets/images/lincoln.png',
      name: 'Lincoln Bator',
      role: 'Entrepreneur',
      onFollowTap: () => print('Followed!'),
      onCloseTap: () => print('Closed!'),
    ),
    ProfileCardData(
      profileImagePath: 'assets/images/lydia.png',
      name: 'Lydia Botosh',
      role: 'Entrepreneur',
      onFollowTap: () => print('Followed!'),
      onCloseTap: () => print('Closed!'),
    ),

    // Add more cards...
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchField(
                    hintText: 'Search by event name, tag, or host',
                  ),
                  SizedBox(height: 15.h),

                  Image.asset('assets/images/live_now.png'),
                  SizedBox(height: 15.h),

                  Text(
                    'Upcoming Event near you',
                    style: TextStyle(
                      color: AppColors.headingColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 310.h,
                    child: PageView.builder(
                      itemCount: 20,

                      itemBuilder: (context, index) {
                        return CustomEventRecommendationCard(
                          isBuyTicket: true,
                          imagePath: 'assets/images/upcoming_event.png',
                          title: 'Sunset Rooftop Party',
                          timeRange: '7:00PM – 2:00AM',
                          location: 'Downtown Dubai',
                          price: '20',
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Text(
                    'Upcoming Events near you',
                    style: TextStyle(
                      color: AppColors.headingColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 310.h,
                    child: PageView.builder(
                      itemCount: 20,

                      itemBuilder: (context, index) {
                        return CustomEventRecommendationCard(
                          isBuyTicket: true,
                          imagePath: 'assets/images/upcoming_event.png',
                          title: 'Sunset Rooftop Party',
                          timeRange: '7:00PM – 2:00AM',
                          location: 'Downtown Dubai',
                          price: '20',
                        );
                      },
                    ),
                  ),

                  Text(
                    'Upcoming Events near you',
                    style: TextStyle(
                      color: AppColors.headingColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 195.h,
                    child: ListView.separated(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemCount: profileCards.length,
                      itemBuilder: (context, index) {
                        return CustomProfileCard(
                          profileImagePath:
                              profileCards[index].profileImagePath,
                          name: profileCards[index].name,
                          role: profileCards[index].role,
                          onFollowTap: profileCards[index].onFollowTap,
                          onCloseTap: profileCards[index].onCloseTap,
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(width: 8.0.w),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Friend Activity',
                    style: TextStyle(
                      color: AppColors.headingColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 306.h,
                    child: PageView.builder(
                      itemCount: 20,

                      itemBuilder: (context, index) {
                        return CustomEventRecommendationCard(
                          isBuyTicket: false,
                          imagePath: 'assets/images/friends.png',
                          title: 'Creative Community Hangout',
                          timeRange: '7:00PM – 2:00AM',
                          location: 'Abu Dhabi',
                          price: '20',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.black,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: const Color.fromARGB(255, 169, 33, 33)!,
        color: Colors.black,
        tabs: [
          GButton(
            iconPath: 'assets/icons/home.svg',
            iconColor: Colors.grey[400],
            textColor: AppColors.secconderyColor,
            iconActiveColor: AppColors.secconderyColor,

            text: 'Home',
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          ),
          GButton(
            iconPath: 'assets/icons/explore.svg',
            iconColor: Colors.grey[400],
            textColor: AppColors.secconderyColor,
            iconActiveColor: AppColors.secconderyColor,
            text: 'Explore',
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          ),
          GButton(
            iconPath: 'assets/icons/events.svg',
            iconColor: Colors.grey[400],
            textColor: AppColors.secconderyColor,
            iconActiveColor: AppColors.secconderyColor,
            text: 'Events',
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          ),
          GButton(
            iconPath: 'assets/icons/chat.svg',
            iconColor: Colors.grey[400],
            textColor: AppColors.secconderyColor,
            iconActiveColor: AppColors.secconderyColor,
            text: 'Chat',
            backgroundGradient: LinearGradient(
              colors: [Color(0xFF443FBD), Color(0xffFD0193)],
            ),
          ),
        ],
        selectedIndex: 0,
        onTabChange: (index) {
          setState(() {
            //   _selectedIndex = index;
          });
        },
      ),
    );
  }
}
