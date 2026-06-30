import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Features/Home/presentation/Cubit/home_cubit.dart';
import 'package:bookia_app/Features/Home/presentation/Cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.pageController,
    required this.bannerImages,
    required this.onPageChanged,
  });

  final PageController pageController;
  final List<String> bannerImages;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();

        return SizedBox(
          height: 196,
          child: PageView.builder(
            controller: pageController,
            itemCount: cubit.sliders.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              errorBuilder:
              (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.greyColor.withValues(alpha: 0.2),
                  ),
                  child: const Center(
                    child: Icon(Icons.error, color: Colors.red),
                  ),
                );
              };
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      cubit.sliders[index].image ?? '',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.blackColor.withValues(alpha: 0.06),
                            AppColors.blackColor.withValues(alpha: 0.15),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
