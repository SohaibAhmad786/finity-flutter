import 'package:finity/extension/extension.dart';
import 'package:finity/router/router.dart';
import 'package:finity/screens/register_phone_number/screen.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget implements AppRouter {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  @override
  String path() {
    return '/auth/register';
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

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                    Text(
                      'Register',
                      style: context.textTheme.displaySmall,
                    ),
                    Gap(20.cl(18, 36)),
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
                    TextFormField(
                      controller: _fullNameController,
                      validator: (String? val) {
                        if (val == null) {
                          return 'Required';
                        } else if (val.trim().length <= 3) {
                          return 'Enter your full name';
                        } else {
                          return null;
                        }
                      },
                      style: context.textTheme.bodyMedium,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (_) {
                        setState(() {
                          isFormValid =
                              _formKey.currentState?.validate() ?? false;
                        });
                      },
                      keyboardType: TextInputType.name,
                      autofillHints: const <String>[AutofillHints.name],
                      decoration: InputDecoration(
                        hintText: 'Full Name',
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
                    Gap(14.cl(10, 28)),
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
                    Gap(14.cl(10, 28)),
                    TextFormField(
                      controller: _passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (_) {
                        setState(() {
                          isFormValid =
                              _formKey.currentState?.validate() ?? false;
                        });
                      },
                      style: context.textTheme.bodyMedium,
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const <String>[AutofillHints.newPassword],
                      validator: (String? val) {
                        if (val == null) {
                          return 'Required';
                        } else if (!val.isAlphabetOnly) {
                          return 'Password must contain only alphabets and numbers';
                        } else if (val.length < 8) {
                          return 'Password must be 8 or more characters long';
                        } else {
                          return null;
                        }
                      },
                      obscureText: isPasswordHidden,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          padding: 0.pdAll,
                          visualDensity: VisualDensity.compact,
                          icon: Icon(
                            isPasswordHidden.when(
                                use: Remix.eye_close_line,
                                elseUse: Remix.eye_2_line),
                          ),
                        ),
                      ),
                    ),
                    Gap(14.cl(10, 28)),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (String? val) {
                        if (val == null) {
                          return 'Required';
                        } else if (val != _passwordController.text) {
                          return 'Passwords do not match.';
                        } else {
                          return null;
                        }
                      },
                      obscureText: isPasswordHidden,
                      style: context.textTheme.bodyMedium,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (_) {
                        setState(() {
                          isFormValid =
                              _formKey.currentState?.validate() ?? false;
                        });
                      },
                      keyboardType: TextInputType.visiblePassword,
                      autofillHints: const <String>[AutofillHints.password],
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                    ),
                    Gap(14.cl(10, 28)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? val) {
                            setState(() {
                              isChecked = val ?? isChecked;
                            });
                          },
                          fillColor: ((!isChecked).when(
                                  use: Colors.transparent,
                                  elseUse: AppTheme.color.secondaryColor))
                              .all,
                          checkColor: Colors.white,
                          visualDensity: VisualDensity.comfortable,
                          side: BorderSide(
                            width: 4.cl(2, 4),
                            color: isChecked.when(
                              use: AppTheme.color.secondaryColor,
                              elseUse: AppTheme.color.secondaryTextColor,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: 6.cl(4, 10).brc),
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'I’ve read and agree to the ',
                              style: context.textTheme.bodyMedium?.copyWith(
                                  color: AppTheme.color.secondaryTextColor),
                              children: [
                                TextSpan(
                                  text: 'terms',
                                  style: context.textTheme.headlineMedium
                                      ?.copyWith(
                                          color: AppTheme.color.primaryColor),
                                ),
                                const TextSpan(text: ' of '),
                                TextSpan(
                                  text: 'privacy policy',
                                  style: context.textTheme.headlineMedium
                                      ?.copyWith(
                                          color: AppTheme.color.primaryColor),
                                ),
                              ]),
                        ).expand,
                      ],
                    ),
                    Gap(30.cl(30, 100)),
                    TextButton(
                      onPressed: isFormValid
                          ? () {
                              if (_formKey.currentState?.validate() ?? false) {
                                const RegisterPhoneNumberScreen().goto();
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
                        'Next',
                      ),
                    ).center,
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
