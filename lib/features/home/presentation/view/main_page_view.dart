import 'package:cis_logistics_app/features/home/presentation/view/home_page_view.dart';
import 'package:cis_logistics_app/features/home/presentation/view/notification_screen.dart';
import 'package:cis_logistics_app/features/home/presentation/view/qr_scanner_screen.dart';
import 'package:cis_logistics_app/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  int _currentIndex = 0;
  late PageController _pageController;

  static const List<Widget> _screens = [
    HomePageView(),
    QRScannerScreen(),
    NotificationScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
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
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: _screens,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
