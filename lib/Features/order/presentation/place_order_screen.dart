import 'package:bookia_app/Core/Common%20Widgets/custom_back_button.dart';
import 'package:bookia_app/Core/Common%20Widgets/customtextformdield.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/routes/navigation.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;
  String? _selectedGovernorate;

  final List<String> _governorates = [
    'Cairo',
    'Giza',
    'Alexandria',
    'Dakahlia',
    'Red Sea',
    'Beheira',
    'Fayoum',
    'Gharbia',
    'Ismailia',
    'Monufia',
    'Minya',
    'Qalyubia',
    'Sohag',
    'Suez',
    'Aswan',
    'Luxor',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
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
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, viewportConstraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: MyBodyView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          'Place Your Order',
                          style: TextStyles.headline.copyWith(
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        12.h,
                        // Subtitle
                        Text(
                          "Don't worry! It occurs. Please enter the email address linked with your account.",
                          style: TextStyles.body.copyWith(
                            color: AppColors.greyColor,
                            height: 1.4,
                            fontSize: 16,
                          ),
                        ),
                        30.h,

                        // Fields
                        customtextformdield(
                          hintText: 'Full Name',
                          controller: _nameController,
                        ),
                        16.h,
                        customtextformdield(
                          hintText: 'Address',
                          controller: _addressController,
                        ),
                        16.h,
                        customtextformdield(
                          hintText: 'Phone',
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                        ),
                        16.h,

                        // Governorate Dropdown
                        DropdownButtonFormField<String>(
                          value: _selectedGovernorate,
                          decoration: const InputDecoration(
                            hintText: 'Governorate',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.greyColor,
                          ),
                          dropdownColor: AppColors.accentColor,
                          items: _governorates.map((String gov) {
                            return DropdownMenuItem<String>(
                              value: gov,
                              child: Text(
                                gov,
                                style: TextStyles.body.copyWith(
                                  color: AppColors.darkColor,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedGovernorate = newValue;
                            });
                          },
                        ),
                        const Spacer(),
                        30.h,

                        // Price and submit section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyles.title.copyWith(
                                color: AppColors.greyColor,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '\$ 95.00',
                              style: TextStyles.title.copyWith(
                                color: AppColors.darkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        16.h,
                        PrimaryElevatedBotton(
                          title: 'Submit Order',
                          onPressed: () {
                            // Show success dialog or pop
                            pop(context);
                          },
                        ),
                        10.h,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
