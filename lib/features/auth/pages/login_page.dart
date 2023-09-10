import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/common/utils/constants.dart';
import 'package:todo_app/common/widgets/appstyle.dart';
import 'package:todo_app/common/widgets/custom_otn_btn.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import '../../../common/widgets/custom_text.dart';
import 'otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneController = TextEditingController();

  Country country = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "USA",
    example: "USA",
    displayName: "United States",
    displayNameNoCountryCode: "US",
    e164Key: "",
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
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  "assets/images/todo.png",
                  width: 300,
                ),
              ),
              const HeightSpacer(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: "Please Enter Your Phone number",
                  style: appstyle(17, AppConst.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(height: 20),
              Center(
                child: CustomTextField(
                  controller: phoneController,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
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
                              )),
                          onSelect: (code) {
                            setState(() {});
                          },
                        );
                      },
                      child: ReusableText(
                          text: "${country.flagEmoji} + ${country.phoneCode}",
                          style:
                              appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: "Enter Phone Number",
                  hintStyle: appstyle(16, Colors.black, FontWeight.w600),
                ),
              ),
              // Center(
              //   child: Container(
              //     width: AppConst.kWidth * 0.9,
              //     decoration: BoxDecoration(
              //       color: AppConst.kLight,
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(AppConst.kRadius),
              //       ),
              //     ),
              //     child: TextFormField(
              //       keyboardType: TextInputType.phone,
              //       cursorHeight: 25,
              //       decoration: InputDecoration(
              //         hintText: "Enter Your Phone Number",
              //         suffixIconColor: AppConst.kBkDark,
              //         hintStyle: appstyle(16, Colors.black, FontWeight.w600),
              //         errorBorder: const OutlineInputBorder(
              //           borderRadius: BorderRadius.zero,
              //           borderSide:
              //               BorderSide(color: AppConst.kRed, width: 0.5),
              //         ),
              //         focusedBorder: const OutlineInputBorder(
              //           borderRadius: BorderRadius.zero,
              //           borderSide:
              //               BorderSide(color: Colors.transparent, width: 0.5),
              //         ),
              //         focusedErrorBorder: const OutlineInputBorder(
              //           borderRadius: BorderRadius.zero,
              //           borderSide:
              //               BorderSide(color: AppConst.kRed, width: 0.5),
              //         ),
              //         disabledBorder: const OutlineInputBorder(
              //           borderRadius: BorderRadius.zero,
              //           borderSide:
              //               BorderSide(color: AppConst.kGreyDk, width: 0.5),
              //         ),
              //         enabledBorder: const OutlineInputBorder(
              //           borderRadius: BorderRadius.zero,
              //           borderSide:
              //               BorderSide(color: AppConst.kBkDark, width: 0.5),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const HeightSpacer(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomOtlBtn(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpPage()));
                  },
                  height: AppConst.kHeight * 0.07,
                  width: AppConst.kWidth * 0.9,
                  color: AppConst.kBkDark,
                  color2: AppConst.kLight,
                  text: "Send Code",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
