import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/custom_otn_btn.dart';
import 'package:task_management/common/widgets/custom_textfield.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/features/auth/pages/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  Country country = Country(
    countryCode: 'US',
    phoneCode: '1',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'USA',
    example: 'USA',
    displayName: 'United States',
    displayNameNoCountryCode: 'US',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset('assets/images/todo.png'),
              ),
              const HeightSpacer(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: 'Please enter your phone number',
                  style: appstyle(17, AppConst.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(height: 20),
              Center(
                child: CustomTextField(
                  controller: phoneController,
                  prefixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            backgroundColor: AppConst.kLight,
                            bottomSheetHeight: AppConst.kHeight * 0.6,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConst.kRadius),
                              topRight: Radius.circular(AppConst.kRadius),
                            ),
                          ),
                          onSelect: (code) {
                            setState(() {});
                          },
                        );
                      },
                      child: ReusableText(
                        text: '${country.flagEmoji} + ${country.phoneCode}',
                        style: appstyle(18, AppConst.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  hintText: 'Enter phone number',
                  hintStyle: appstyle(16, AppConst.kBkDark, FontWeight.w600),
                ),
              ),
              const HeightSpacer(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomOtnBtn(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpPage()));
                    },
                    width: AppConst.kWidth * 0.9,
                    height: AppConst.kHeight * 0.07,
                    color: AppConst.kBkDark,
                    color2: AppConst.kLight,
                    text: 'Send code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
