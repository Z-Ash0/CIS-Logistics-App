import 'package:cached_network_image/cached_network_image.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? Assets.user,
        progressIndicatorBuilder: (_, _, downloadProgress) =>
            CircularProgressIndicator(
              value: downloadProgress.progress,
              color: AppColors.darkGreen,
            ),
        errorWidget: (_, _, _) => Image.asset(Assets.user, height: 24),
        fit: BoxFit.cover,
      ),
    );
  }
}
