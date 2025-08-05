import 'package:cached_network_image/cached_network_image.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.imageUrl, this.size = 20.0});

  final String? imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: AppColors.lightGray,
      child: ClipOval(child: _buildAvatarContent()),
    );
  }

  Widget _buildAvatarContent() {
    // Check if imageUrl is null, empty, or not a valid network URL
    if (imageUrl == null ||
        imageUrl!.isEmpty ||
        !_isValidNetworkUrl(imageUrl!)) {
      return _buildDefaultAvatar();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: size * 2,
      height: size * 2,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (_, _, downloadProgress) =>
          CircularProgressIndicator(
            value: downloadProgress.progress,
            color: AppColors.darkGreen,
            strokeWidth: 2,
          ),
      errorWidget: (_, _, _) => _buildDefaultAvatar(),
    );
  }

  Widget _buildDefaultAvatar() {
    return Image.asset(
      Assets.user,
      width: size * 1.2,
      height: size * 1.2,
      fit: BoxFit.cover,
    );
  }

  bool _isValidNetworkUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }
}
