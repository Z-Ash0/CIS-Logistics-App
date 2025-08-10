import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/features/home/presentation/view/home_page_view.dart';
import 'package:cis_logistics_app/features/home/presentation/view/instructions_screen.dart';
import 'package:cis_logistics_app/features/home/presentation/view/qr_scanner_screen.dart';
import 'package:cis_logistics_app/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:flutter/material.dart';

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
  final GlobalKey<State<QRScannerScreen>> _qrScannerKey =
      GlobalKey<State<QRScannerScreen>>();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _screens = [
      const HomePageView(),
      QRScannerScreen(key: _qrScannerKey),
      const InstructionsScreen(),
    ];

    if (widget.showLoginSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          FlushBarUtils.customFlushBarWithButtonIcon(
            context,
            onTap: () {
              if (context.mounted) {
                _onNavItemTapped(2);
              }
            },
            msg: AppStrings.loginSuccess,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    if (_currentIndex != index) {
      // Stop QR scanner when leaving QR page
      if (_currentIndex == 1) {
        (_qrScannerKey.currentState as dynamic)?.stopScanner();
      }

      setState(() {
        _currentIndex = index;
      });

      _pageController.jumpToPage(index);

      // Start QR scanner when entering QR page
      if (index == 1) {
        Future.delayed(const Duration(milliseconds: 100), () {
          (_qrScannerKey.currentState as dynamic)?.startScanner();
        });
      }
    }
  }

  void _onPageChanged(int index) {
    // Stop QR scanner when leaving QR page
    if (_currentIndex == 1 && index != 1) {
      (_qrScannerKey.currentState as dynamic)?.stopScanner();
    }

    setState(() {
      _currentIndex = index;
    });

    // Start QR scanner when entering QR page
    if (index == 1) {
      Future.delayed(const Duration(milliseconds: 100), () {
        (_qrScannerKey.currentState as dynamic)?.startScanner();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _screens,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavItemTapped,
        ),
      ),
    );
  }
}
