import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehman_zone/config/utilits/app_colors.dart';
import 'package:rehman_zone/features/dashboard/provider/dashboardprovider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, viewModel, child) {
      return AnimatedNotchBottomBar(
        notchBottomBarController: viewModel.notchController,
        color: Colors.white,
        showLabel: true,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Image.asset(
              "asset/images/quranicon.png",
              color: Colors.grey,
            ),
            activeItem: Image.asset(
              "asset/images/quranicon.png",
              color: AppColors.background,
            ),
            itemLabel: 'Quran',
          ),
          BottomBarItem(
            inActiveItem: Image.asset(
              "asset/images/hadidicon.png",
              color: Colors.grey,
            ),
            activeItem: Image.asset(
              "asset/images/hadidicon.png",
              color: AppColors.background,
            ),
            itemLabel: 'Hadith',
          ),
          const BottomBarItem(
            inActiveItem: Icon(Icons.home, color: Colors.grey),
            activeItem: Icon(Icons.home, color: AppColors.background),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Image.asset(
              "asset/images/exploreicon.png",
              color: Colors.grey,
            ),
            activeItem: Image.asset(
              "asset/images/exploreicon.png",
              color: AppColors.background,
            ),
            itemLabel: 'Explore',
          ),
          BottomBarItem(
            inActiveItem: Image.asset(
              "asset/images/goalicon.png",
              color: Colors.grey,
            ),
            activeItem: Image.asset(
              "asset/images/goalicon.png",
              color: AppColors.background,
            ),
            itemLabel: 'Goal',
          ),
        ],
        onTap: viewModel.updateIndex,
        kIconSize: 24.0,
        kBottomRadius: 28.0,
      );
    });
  }
}
