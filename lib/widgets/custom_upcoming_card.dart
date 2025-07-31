import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getxmvvm/resources/colors/app_colors.dart';

class CustomEventRecommendationCard extends StatelessWidget {
  final String imagePath;

  final String title;
  final String timeRange;
  final String location;
  final String price;
  final VoidCallback? onChatTap;
  final VoidCallback? onFavTap;
  final VoidCallback? onBuyTicketTap;
  bool? isBuyTicket = false;

  CustomEventRecommendationCard({
    Key? key,
    required this.imagePath,

    required this.title,
    required this.timeRange,
    required this.location,
    required this.price,
    this.onChatTap,
    this.onFavTap,
    this.onBuyTicketTap,
    this.isBuyTicket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338,

      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderCardColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top Image Section with overlays
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.asset(imagePath, width: double.infinity),
          ),

          // Date badge

          // Bottom content section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: AppColors.primaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      timeRange,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.subHeadingColor,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    SvgPicture.asset('assets/icons/time.svg'),
                  ],
                ),
                const SizedBox(height: 6),

                // Location and Buy Ticket
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.subHeadingColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onBuyTicketTap,
                      child: ShaderMask(
                        shaderCallback:
                            (bounds) => const LinearGradient(
                              colors: [
                                Color(0xFF443FBD), // Indigo-violet
                                Color(0xFFFD0193), // Pink-magenta
                              ],
                            ).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                        child:
                            isBuyTicket == true
                                ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Buy Ticket ',
                                      style: TextStyle(
                                        color:
                                            Colors
                                                .white, // Gets overridden by ShaderMask
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),

                                    SizedBox(width: 3.w),
                                    SvgPicture.asset('assets/icons/arrow.svg'),
                                  ],
                                )
                                : Row(children: []),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Divider(),

                // Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Prices',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: onBuyTicketTap,
                      child: ShaderMask(
                        shaderCallback:
                            (bounds) => const LinearGradient(
                              colors: [
                                Color(0xFF443FBD), // Indigo-violet
                                Color(0xFFFD0193), // Pink-magenta
                              ],
                            ).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                        child: Text(
                          '\$$price',
                          style: TextStyle(
                            color:
                                AppColors
                                    .subHeadingColor, // Gets overridden by ShaderMask
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
