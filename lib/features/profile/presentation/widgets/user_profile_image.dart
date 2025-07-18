import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF2D9B8B), width: 3),
          ),
          child: ClipOval(
            child: Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.person, size: 60, color: Colors.grey),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.edit, color: AppColors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
