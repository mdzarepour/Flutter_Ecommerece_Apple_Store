// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:apple_store/core/utils/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:apple_store/screens/category_screen.dart';
import 'package:apple_store/screens/home_screen.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
  ]; // Renamed for clarity

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: IndexedStack(index: _selectedScreenIndex, children: _screens),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(scheme),
    );
  }

  Widget _buildBottomNavigationBar(ColorScheme scheme) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            gradient: ConstGradients.bottomNavigationGradient,
            border: Border(
              top: BorderSide(color: Colors.white.withOpacity(0.2), width: 1.5),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedScreenIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedScreenIndex == 0 ? Iconsax.home5 : Iconsax.home_1,
                ),
                label: 'خانه',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _selectedScreenIndex == 1
                      ? Iconsax.category_25
                      : Iconsax.category_2,
                ),
                label: 'دسته بندی',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
}
