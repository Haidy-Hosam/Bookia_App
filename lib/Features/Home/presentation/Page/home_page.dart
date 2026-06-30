import 'package:bookia_app/Core/Constants/app_images.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Features/Home/presentation/Cubit/home_cubit.dart';
import 'package:bookia_app/Features/Home/presentation/Cubit/home_state.dart';
import 'package:bookia_app/Features/Home/presentation/Widgets/bannerIndicator.dart';
import 'package:bookia_app/Features/Home/presentation/Widgets/bannerslider.dart';
import 'package:bookia_app/Features/Home/presentation/Widgets/best_seller_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int _currentBannerIndex = 0;

  final List<String> _bannerImages = const [
    AppImages.mainPhotoInHome,
    AppImages.background,
    AppImages.mainPhotoInHome,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset(AppImages.primarylogosvg, width: 40, height: 40),
            10.w,
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: AppColors.darkColor,
            ),
          ),
        ],
      ),

      ////////////////////////////////////////////////
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.h,
                            BannerSlider(
                              pageController: _pageController,
                              bannerImages: _bannerImages,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentBannerIndex = index;
                                });
                              },
                            ),
                            12.h,
                            BannerIndicator(
                              currentIndex: _currentBannerIndex,
                              length: _bannerImages.length,
                            ),
                            30.h,
                            BestSellerSection(),
                          ],
                        );
              },
            ),
          ),
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
