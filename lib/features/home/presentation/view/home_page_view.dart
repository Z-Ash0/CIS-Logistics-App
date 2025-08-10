import 'package:cis_logistics_app/core/helpers/theme_extension.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/core/widgets/user_avatar.dart';
import 'package:cis_logistics_app/features/profile/presentation/manager/user_cubit.dart';
import 'package:cis_logistics_app/features/profile/presentation/manager/user_states.dart';
import 'package:cis_logistics_app/features/theme/logic/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      context.read<UserCubit>().loadUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSwitchedLight = context.isLight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildUserSection(), _buildThemeSection(isSwitchedLight)],
        ),

        // modrek image
        Image.asset(
          Assets.modrekWelcome,
          height: context.setBasedOnScreenHeight(0.4),
        ),
        const SizedBox(),
      ],
    );
  }

  Widget _buildUserSection() {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) => FlushBarUtils.flushBarError(message, context),
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          initial: () => true,
          orElse: () => false,
        );

        return GestureDetector(
          onTap: isLoading
              ? null
              : () => context.navigateTo(Routes.userProfileScreen),
          child: Skeletonizer(
            enabled: isLoading,
            child: Row(
              children: [
                Hero(
                  tag: 'user profile',
                  child: UserAvatar(
                    imageUrl: state.whenOrNull(
                      success: (userData) => userData?.avatar,
                    ),
                    size: 19.0,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  _getWelcomeMessage(state, isLoading),
                  style: AppTextStyles.medium18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getWelcomeMessage(UserState state, bool isLoading) {
    String userName = 'user';

    try {
      userName =
          state.whenOrNull(
            success: (userData) => _extractFirstName(userData?.name),
            failure: (_) => 'user',
          ) ??
          'user';
    } catch (e) {
      userName = 'user';
    }

    return '${AppStrings.welcome}, $userName!';
  }

  String _extractFirstName(String? fullName) {
    if (fullName?.isEmpty ?? true) return 'user';

    try {
      final firstName = fullName!.split(' ').first;
      return firstName.length > 15
          ? '${firstName.substring(0, 15)}…'
          : firstName;
    } catch (e) {
      return 'user';
    }
  }

  Widget _buildThemeSection(bool isSwitchedLight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform.scale(
          scale: 0.8,
          child: Switch(
            activeColor: AppColors.white,
            activeTrackColor: AppColors.lightGreen,
            value: isSwitchedLight,
            onChanged: _handleThemeToggle,
          ),
        ),
        _buildThemeIcon(isSwitchedLight),
      ],
    );
  }

  void _handleThemeToggle(bool value) {
    setState(() {});
    final themeMode = value ? ThemeMode.light : ThemeMode.dark;
    context.read<ThemeCubit>().toggleTheme(themeMode);
  }

  Widget _buildThemeIcon(bool isSwitchedLight) {
    return Icon(
      isSwitchedLight ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars,
      color: isSwitchedLight ? AppColors.lightGreen : AppColors.lighterGreen,
      size: 28,
    );
  }
}
