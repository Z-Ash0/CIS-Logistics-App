import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/features/home/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final bool isTablet = context.screenWidth > 600;
    final double bgHeight = isTablet
        ? context.setBasedOnScreenHeight(0.06)
        : context.setBasedOnScreenHeight(0.08);
    return SizedBox(
      height: context.setBasedOnScreenHeight(0.12),
      child: Stack(
        children: [
          // Background navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: bgHeight,
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
            ),
          ),
          // Navigation items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavIBarItem(
                onTap: () => widget.onTap(0),
                text: 'Home',
                icon: Assets.home,
                isSelected: widget.currentIndex == 0,
              ),
              BottomNavIBarItem(
                onTap: () => widget.onTap(1),
                text: 'QR Scanner',
                icon: Assets.qrScanner,
                isSelected: widget.currentIndex == 1,
              ),
              BottomNavIBarItem(
                onTap: () => widget.onTap(2),
                text: 'Notifications',
                icon: Assets.notification,
                isSelected: widget.currentIndex == 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
