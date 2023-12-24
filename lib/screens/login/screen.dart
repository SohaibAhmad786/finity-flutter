import 'package:finity/extension/extension.dart';
import 'package:finity/extension/handler/handler.dart';
import 'package:finity/router/router.dart';
import 'package:finity/screens/screens.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget implements AppRouter {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  String path() {
    return '/auth/login';
  }

  @override
  Widget screen() {
    return this;
  }

  @override
  String title() {
    return 'Log into Account';
  }

  @override
  Transition? transition() {
    return Transition.rightToLeft;
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                      'Login',
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
                    Text(
                      'Forgot Password',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppTheme.color.secondaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    )
                        .gestureHandler(
                            onTap: const ForgotPasswordScreen().stepBackandTo)
                        .toRight,
                    Gap(30.cl(30, 100)),
                    TextButton(
                      onPressed: isFormValid
                          ? () {
                              if (_formKey.currentState?.validate() ?? false) {
                                const UserWelcomeScreen().goto();
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
                        'Login',
                      ),
                    ).center,
                    Gap(30.cl(30, 100)),
                    Text(
                      "Don't have an account?",
                      style: context.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: const RegisterScreen().stepBackandTo,
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
                            'Register',
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
