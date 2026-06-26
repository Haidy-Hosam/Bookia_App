import 'package:bookia_app/Core/Common%20Widgets/custom_back_button.dart';
import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/routes/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _cityController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Sayed Abdul-Aziz');
    _phoneController = TextEditingController();
    _cityController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22.0, top: 8.0, bottom: 8.0),
          child: CustomBackButton(
            onPressed: () {
              pop(context);
            },
          ),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyles.title.copyWith(
            color: AppColors.darkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: MyBodyView(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              20.h,
              // Profile image stack
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[600],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.borderColor,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              40.h,

              // Fields
              customtextformdield(
                hintText: 'Full Name',
                controller: _nameController,
              ),
              16.h,
              customtextformdield(
                hintText: 'Phone',
                keyboardType: TextInputType.phone,
                controller: _phoneController,
              ),
              16.h,
              customtextformdield(
                hintText: 'City',
                controller: _cityController,
              ),
              16.h,
              customtextformdield(
                hintText: 'Address',
                controller: _addressController,
              ),
              30.h,
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
          child: PrimaryElevatedBotton(
            title: 'Update Profile',
            onPressed: () {
              pop(context);
            },
          ),
        ),
      ),
    );
  }
}
