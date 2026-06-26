import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/routes/navigation.dart';
import 'package:bookia_app/Core/routes/routes.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Features/profile/presentation/widgets/profile_option_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyles.title.copyWith(
            color: AppColors.darkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pushReplacement(context, Routes.login);
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.darkColor,
              size: 26,
            ),
          ),
          10.w,
        ],
      ),
      body: MyBodyView(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User profile row
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey[600],
                    ),
                  ),
                  20.w,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Haidy Hosam El-Dien',
                          style: TextStyles.title.copyWith(
                            fontSize: 20,
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        6.h,
                        Text(
                          'haidy@gmail.com',
                          style: TextStyles.caption2.copyWith(
                            fontSize: 14,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              30.h,

              // Settings options list
              ProfileOptionTile(
                title: 'My Orders',
                onTap: () {
                  pushTo(context, Routes.placeOrder);
                },
              ),
              12.h,
              ProfileOptionTile(
                title: 'Edit Profile',
                onTap: () {
                  pushTo(context, Routes.editProfile);
                },
              ),
              12.h,
              ProfileOptionTile(
                title: 'Reset Password',
                onTap: () {
                  pushTo(context, Routes.createPassword);
                },
              ),
              12.h,
              ProfileOptionTile(
                title: 'FAQ',
                onTap: () {
                  // FAQ tap placeholder
                },
              ),
              12.h,
              ProfileOptionTile(
                title: 'Contact Us',
                onTap: () {
                  // Contact Us tap placeholder
                },
              ),
              12.h,
              ProfileOptionTile(
                title: 'Privacy & Terms',
                onTap: () {
                  // Privacy & Terms tap placeholder
                },
              ),
              20.h,
            ],
          ),
        ),
      ),
    );
  }
}
