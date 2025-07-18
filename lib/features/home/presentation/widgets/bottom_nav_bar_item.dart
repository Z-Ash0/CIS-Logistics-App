import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavIBarItem extends StatelessWidget {
  const BottomNavIBarItem({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final String text;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final bool isTablet = context.screenWidth > 600;
    final itemWidth = isTablet ? 120.0 : 80.0;
    final circleSize = isTablet
        ? context.setBasedOnScreenHeight(0.05)
        : context.setBasedOnScreenHeight(0.07);
    final iconSize = isTablet ? 28.0 : 24.0;
    final fontSize = isTablet ? 14.0 : 12.0;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: itemWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isSelected
                ? Container(
                    width: circleSize,
                    height: circleSize,
                    padding: EdgeInsets.all(isTablet ? 18 : 15),
                    margin: EdgeInsets.only(bottom: isTablet ? 6 : 4),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: AppColors.lightGreen.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      icon,
                      fit: BoxFit.contain,
                      color: AppColors.lightGreen,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(bottom: isTablet ? 6 : 4),
                    child: Image.asset(
                      icon,
                      fit: BoxFit.contain,
                      color: AppColors.white,
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(bottom: isTablet ? 12 : 8),
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
