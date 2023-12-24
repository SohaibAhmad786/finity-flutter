import 'package:finity/extension/extension.dart';
import 'package:finity/router/router.dart';
import 'package:finity/screens/login/screen.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPasswordScreen extends StatefulWidget implements AppRouter {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();

  @override
  String path() {
    return '/auth/forgot_password';
  }

  @override
  Widget screen() {
    return this;
  }

  @override
  String title() {
    return 'Create Account';
  }

  @override
  Transition? transition() {
    return Transition.rightToLeft;
  }
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isChecked = false;
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

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
        body: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: Get.back,
                      style: ButtonStyle(
                          elevation: 12.cl(10, 20).all,
                          padding: 14.cl(14, 24).pdAll.all,
                          shape: RoundedRectangleBorder(
                                  borderRadius: 14.cl(8, 28).brc)
                              .all,
                          backgroundColor: Colors.white.all,
                          shadowColor:
                              const Color(0xff6F889D).withOpacity(0.10).all),
                      icon: Icon(
                        Remix.arrow_left_line,
                        color: AppTheme.color.textColor,
                      ),
                    ),
                    Gap(30.cl(40, 80)),
                    Text(
                      'Forgot Password',
                      style: context.textTheme.displaySmall,
                    ),
                    Gap(20.cl(18, 36)),
                    RichText(
                      text: TextSpan(
                          text: 'Please enter your ',
                          style: context.textTheme.bodyMedium,
                          children: [
                            TextSpan(
                                text: 'email address or phone number',
                                style: context.textTheme.headlineMedium),
                            const TextSpan(text: ' to reset your password')
                          ]),
                    ),
                    Gap(20.cl(18, 36)),
                    TextFormField(
                      controller: _emailController,
                      onChanged: (_) {
                        setState(() {
                          isFormValid =
                              _formKey.currentState?.validate() ?? false;
                        });
                      },
                      style: context.textTheme.bodyMedium,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const <String>[
                        AutofillHints.email,
                        AutofillHints.username
                      ],
                      validator: (String? val) {
                        if (val == null) {
                          return 'Required';
                        } else if (!val.isEmail) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Email Address',
                      ),
                    ),
                    Gap(30.cl(30, 100)),
                    TextButton(
                      onPressed: isFormValid
                          ? () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context.toast(
                                    toastMessage:
                                        'Check your email to find steps to reset password',
                                    type: ToastSnackBarType.info);
                                2
                                    .seconds
                                    .delay(const LoginScreen().stepBackandTo);
                              }
                            }
                          : null,
                      style: context.theme.textButtonTheme.style?.copyWith(
                        minimumSize: Size(90.w, 20.cl(18, 30)).all,
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return AppTheme.color.idealColor;
                          }
                          return AppTheme.color.secondaryColor;
                        }),
                        shadowColor:
                            MaterialStateProperty.resolveWith((states) {
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
                        'Send',
                      ),
                    ).center,
                    Gap(30.cl(30, 100)),
                    Text(
                      'Remembered your details?',
                      style: context.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: const LoginScreen().stepBackandTo,
                      style: context.theme.textButtonTheme.style?.copyWith(
                        backgroundColor: Colors.transparent.all,
                        foregroundColor: AppTheme.color.primaryColor.all,
                        shadowColor: Colors.transparent.all,
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
                )).scrollable().contain(
              width: 100.w,
              height: 100.h,
              padding: 22.cl(18, 46).pdAll,
            ),
      ),
    );
  }
}
