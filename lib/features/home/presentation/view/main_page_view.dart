import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/features/scanner/presentation/manager/register_event_cubit.dart';
import 'package:cis_logistics_app/features/home/presentation/view/home_page_view.dart';
import 'package:cis_logistics_app/features/home/presentation/view/instructions_screen.dart';
import 'package:cis_logistics_app/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:cis_logistics_app/features/scanner/presentation/views/qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageView extends StatefulWidget {
  final int initialIndex;
  final bool showLoginSuccess;

  const MainPageView({
    super.key,
    this.initialIndex = 0,
    this.showLoginSuccess = false,
  });

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);

    if (widget.showLoginSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FlushBarUtils.customFlushBarWithButtonIcon(
          context,
          onTap: () => _navigateToPage(2),
          msg: AppStrings.loginSuccess,
        );
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    if (_currentIndex == index) return;

    setState(() => _currentIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            children: [
              const HomePageView(),
              BlocProvider(
                create: (context) => getIt<RegisterEventCubit>(),
                child: const QRScannerScreen(),
              ),
              const InstructionsScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _navigateToPage,
        ),
      ),
    );
  }
}
