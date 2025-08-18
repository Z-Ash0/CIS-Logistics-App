import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
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
    final double totalHeight = isTablet
        ? context.setBasedOnScreenHeight(
            0.09,
          ) // Reduced from 0.12 but enough for content
        : context.setBasedOnScreenHeight(0.1);
    return SizedBox(
      height: totalHeight,
      child: Stack(children: [_backgroundNavBar(bgHeight), _navigationItems()]),
    );
  }

  Row _navigationItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BottomNavIBarItem(
          onTap: () => widget.onTap(0),
          text: AppStrings.home,
          icon: Assets.home,
          isSelected: widget.currentIndex == 0,
        ),
        BottomNavIBarItem(
          onTap: () => widget.onTap(1),
          text: AppStrings.qrScanner,
          icon: Assets.qrScanner,
          isSelected: widget.currentIndex == 1,
        ),
        BottomNavIBarItem(
          onTap: () => widget.onTap(2),
          text: AppStrings.instructions,
          icon: Assets.instructions,
          isSelected: widget.currentIndex == 2,
        ),
      ],
    );
  }

  Positioned _backgroundNavBar(double bgHeight) {
    return Positioned(
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
    );
  }
}
