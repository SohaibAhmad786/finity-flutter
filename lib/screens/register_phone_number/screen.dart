import 'package:country_list_pick/country_list_pick.dart';
import 'package:finity/extension/extension.dart';
import 'package:finity/router/router.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPhoneNumberScreen extends StatefulWidget implements AppRouter {
  const RegisterPhoneNumberScreen({super.key});

  @override
  State<RegisterPhoneNumberScreen> createState() =>
      _RegisterPhoneNumberScreenState();

  @override
  String path() {
    return '/auth/register/phone_number';
  }

  @override
  Widget screen() {
    return this;
  }

  @override
  String title() {
    return 'Register Phone Number';
  }

  @override
  Transition? transition() {
    return null;
  }
}

class _RegisterPhoneNumberScreenState extends State<RegisterPhoneNumberScreen> {
  String selectedCountryCode = '+234';
  final TextEditingController _phoneNumberController =
      TextEditingController(text: '+234');
  bool isFormValid = false;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        gestures: const [GestureType.onTap],
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            toolbarOpacity: 0,
            toolbarHeight: 0,
            surfaceTintColor: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: context.textTheme.displaySmall,
              ),
              Gap(
                20.cl(18, 36),
              ),
              RichText(
                text: TextSpan(
                  text: 'Please enter ',
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'your phone number',
                      style: context.textTheme.headlineMedium,
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'location',
                      style: context.textTheme.headlineMedium,
                    ),
                    const TextSpan(text: ' so we can verify you.'),
                  ],
                ),
              ),
              Gap(
                35.cl(18, 90),
              ),
              CountryListPick(
                appBar: AppBar(
                  backgroundColor: AppTheme.color.primaryColor,
                  foregroundColor: Colors.white,
                  title: Text(
                    'Choose your location',
                    style: context.textTheme.headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                pickerBuilder:
                    (BuildContext context, CountryCode? countryCode) {
                  return IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          countryCode?.flagUri ?? '',
                          package: 'country_list_pick',
                          width: 24.cl(20, 50),
                          fit: BoxFit.fitWidth,
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                        ).paddingSymmetric(
                          horizontal: 5.cl(5, 12),
                        ),
                        Text(
                          'Choose your location',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ).expand,
                        const Icon(Remix.arrow_down_s_line)
                      ],
                    ),
                  );
                },
                // To disable option set to false
                theme: CountryTheme(
                  isShowFlag: true,
                  isShowTitle: true,
                  isShowCode: true,
                  showEnglishName: true,
                  alphabetTextColor: AppTheme.color.textColor,
                  alphabetSelectedBackgroundColor:
                      AppTheme.color.secondaryColor,
                  alphabetSelectedTextColor: AppTheme.color.backgroundColor,
                  labelColor: AppTheme.color.textColor,
                  lastPickText: 'Chosen Location',
                  searchText: 'Choose your location',
                  searchHintText: 'Search by country name, e.g: Nigeria',
                ),
                initialSelection: '+234',
                onChanged: (CountryCode? code) {
                  setState(() {
                    _phoneNumberController.text =
                        '${code?.dialCode ?? ''}${_phoneNumberController.text.replaceFirst(selectedCountryCode, '')}';
                    selectedCountryCode = code?.dialCode ?? selectedCountryCode;
                  });
                },
                useUiOverlay: false,
                useSafeArea: false,
              ),
              Gap(
                25.cl(18, 50),
              ),
              Text(
                'Enter your Phone Number',
                style: context.textTheme.headlineMedium,
              ),
              Gap(
                12.cl(10, 18),
              ),
              TextFormField(
                controller: _phoneNumberController,
                validator: (String? val) {
                  if (val == null) {
                    return 'Required';
                  } else if (!val.isPhoneNumber) {
                    return 'Enter a valid phone number';
                  } else {
                    return null;
                  }
                },
                smartDashesType: SmartDashesType.enabled,
                style: context.textTheme.bodyMedium,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (_) {
                  setState(() {
                    isFormValid = _phoneNumberController.text.isPhoneNumber;
                  });
                },
                keyboardType: TextInputType.phone,
                autofillHints: const <String>[AutofillHints.telephoneNumber],
                decoration: InputDecoration(
                  focusColor: AppTheme.color.primaryColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.cl(10, 20)),
                    borderSide: BorderSide(
                      width: 6.sp,
                      style: BorderStyle.solid,
                      color: AppTheme.color.primaryColor,
                    ),
                  ),
                ),
              ),
              Gap(25.cl(30, 80)),
              TextButton(
                onPressed: isFormValid ? () {} : null,
                style: context.theme.textButtonTheme.style?.copyWith(
                  minimumSize: Size(90.w, 20.cl(18, 30)).all,
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return AppTheme.color.idealColor;
                    }
                    return AppTheme.color.secondaryColor;
                  }),
                  shadowColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.transparent;
                    }
                    return AppTheme.color.secondaryColor.withOpacity(0.5);
                  }),
                  overlayColor: MaterialStatePropertyAll(
                    AppTheme.color.backgroundColor.withOpacity(0.1),
                  ),
                  padding: MaterialStatePropertyAll(
                    20.cl(16, 28).pdX.copyWith(
                          top: 16.cl(14, 28),
                          bottom: 16.cl(14, 28),
                        ),
                  ),
                ),
                child: const Text(
                  'Register',
                ),
              ).center,
              Row(
                children: [
                  const Spacer(),
                  const Divider().expand,
                  Text(
                    'or',
                    style: context.textTheme.bodyMedium,
                  ).paddingSymmetric(horizontal: 20.cl(18, 36)),
                  const Divider().expand,
                  const Spacer(),
                ],
              ).paddingSymmetric(
                vertical: 16.cl(20, 40),
              ),
              Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: const Color(0xffF5F6FA).all,
                        elevation: 0.0.all),
                    child: Text(
                      'GOOGLE',
                      style: context.textTheme.headlineMedium,
                    ),
                  ).expand,
                  Gap(10.cl(10, 20)),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: const Color(0xffF5F6FA).all,
                      elevation: 0.0.all,
                    ),
                    child: Text(
                      'FACEBOOK',
                      style: context.textTheme.headlineMedium,
                    ),
                  ).expand,
                ],
              ),
              Gap(30.cl(30, 100)),
              Text(
                'Already have an account?',
                style: context.textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: null,
                style: context.theme.textButtonTheme.style?.copyWith(
                  backgroundColor: Colors.transparent.all,
                  foregroundColor: AppTheme.color.primaryColor.all,
                  shadowColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.transparent;
                    }
                    return AppTheme.color.secondaryColor.withOpacity(0.5);
                  }),
                  overlayColor: MaterialStatePropertyAll(
                    AppTheme.color.backgroundColor.withOpacity(0.1),
                  ),
                  padding: MaterialStatePropertyAll(
                    0.pdX.copyWith(
                          top: 16.cl(14, 28),
                          bottom: 16.cl(14, 28),
                        ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Login',
                      style: context.textTheme.headlineLarge
                          ?.copyWith(color: AppTheme.color.primaryColor),
                    ),
                    Gap(14.cl(14, 26)),
                    Icon(
                      Remix.arrow_right_line,
                      size: context.textTheme.headlineLarge?.fontSize,
                      color: AppTheme.color.primaryColor,
                    )
                  ],
                ),
              )
            ],
          ).scrollable().contain(
                width: 100.w,
                height: 100.h,
                padding: 22.cl(18, 46).pdAll,
              ),
        ));
  }
}
