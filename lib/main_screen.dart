import 'package:bookia_app/Core/Common%20Widgets/custom_svg_picture.dart';
import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Features/Home/presentation/home_page.dart';
import 'package:bookia_app/Features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreemState();
}
class _MainAppScreemState extends State<MainAppScreen> {
  int _currentIndex = 0;
final List<Widget> _screens = [
  HomePage(),
  const Scaffold(body: Center(child: Text("bookmark"))),
  const Scaffold(body: Center(child: Text("shop"))),
  const ProfileScreen(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.home,
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 0, 0, 0),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: CustomSvgPicture(
              path: AppImages.home,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.bookmark,
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 0, 0, 0),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: CustomSvgPicture(
              path: AppImages.bookmark,
              color: AppColors.primaryColor,
            ),
            label: 'bookmark',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.shop,
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 0, 0, 0),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: CustomSvgPicture(
              path: AppImages.shop,
              color: AppColors.primaryColor,
            ),
            label: 'shop',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImages.profile,
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 0, 0, 0),
                BlendMode.srcIn,
              ),
            ),
            activeIcon: CustomSvgPicture(
              path: AppImages.profile,
              color: AppColors.primaryColor,
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
