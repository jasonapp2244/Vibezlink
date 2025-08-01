import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getxmvvm/resources/colors/app_colors.dart';
import 'package:getxmvvm/utils/responsive.dart';
import 'package:getxmvvm/view/home_view.dart';
import 'package:getxmvvm/widgets/components/auth_button.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String selectedRole = "User";

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/icons/Problem solving-bro 1.png"),
                  ),
                ],
              ),
              Text(
                'Select Your Role',
                style: GoogleFonts.rethinkSans(
                  fontSize: 32,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Text(
              //   'Select your role to customize your learning experience.',
              //   style: GoogleFonts.rethinkSans(
              //     fontSize: 16,
              //     color: AppColors.white,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Fighter option
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoleSelectionCard(
                    svgImage: "assets/icons/advertising_4318884 1 (1).svg",
                    title: "I’m a User",
                    isSelected: selectedRole == "user",
                    onTap: () {
                      setState(() {
                        selectedRole = "user";
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Promoter option
                  RoleSelectionCard(
                    svgImage: "assets/icons/boxing.svg",
                    title: "I'm a Artist",
                    isSelected: selectedRole == "Artist",
                    onTap: () {
                      setState(() {
                        selectedRole = "Artist";
                      });
                    },
                  ),
                ],
              ),

              const Spacer(),

              AuthButton(
                buttontext: "Next",
                loading: false,
                onPress: () {
                  // selectedRole == null
                  //     ? null
                  //     : () {
                  // Proceed with the selected role
                  print('Selected role: $selectedRole');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomeView()),
                  );
                  // Navigator.pushNamed(context, RoutesName.homeview);
                  // };
                },
              ),

              // ElevatedButton(
              //   onPressed:
              //       selectedRole == null
              //           ? null
              //           : () {
              //             // Proceed with the selected role
              //             print('Selected role: $selectedRole');
              //             // Navigator.pushNamed(context, RoutesName.homeview);
              //           },
              //   style: ElevatedButton.styleFrom(
              //     // backgroundColor: AppColors.red,
              //     foregroundColor: AppColors.fillColor,
              //     minimumSize: const Size(double.infinity, 50),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(22),
              //     ),
              //   ),
              //   child: const Text('Next', style: TextStyle(fontSize: 18)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleSelectionCard extends StatelessWidget {
  final String title;
  final String svgImage;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleSelectionCard({
    required this.title,
    required this.isSelected,
    required this.svgImage,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient:
              isSelected
                  ? AppColors.followButtonGradient
                  : LinearGradient(
                    colors: [
                      AppColors.dividerColor,
                      AppColors.dividerColor,
                      AppColors.dividerColor,
                    ],
                  ),
          // color: isSelected ? AppColors.blueColor : AppColors.fillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.primaryColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgImage.toString()),
            Text(
              title,
              style: GoogleFonts.rethinkSans(
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.fillColor : AppColors.textColor,
              ),
            ),
          ],
        ),

        //  Center(
        //   child: Text(
        //     title,
        //     style: TextStyle(
        //       fontSize: 18,
        //       fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        //       color: isSelected ? Colors.black : Colors.grey.shade600,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
