import 'package:finity/extension/extension.dart';
import 'package:finity/router/router.dart';
import 'package:finity/screens/onboarding/screen.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LaunchScreen extends StatefulWidget implements AppRouter {
  const LaunchScreen({super.key});

  @override
  String path() {
    return '/';
  }

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();

  @override
  Widget screen() {
    return this;
  }

  @override
  String title() {
    return 'Welcome to Finity';
  }

  @override
  Transition? transition() {
    return null;
  }
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.color.secondaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Finity',
              style:
                  context.textTheme.displayLarge?.copyWith(color: Colors.white),
            ),
            Gap(20.cl(22, 40)),
            Text(
              'Money Transfer, Wallet &',
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            Text(
              'Finance UI Kit',
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
            Gap(20.cl(22, 40)),
            TextButton(
              onPressed: const OnboardingScreen().goto,
              style: ButtonStyle(
                  minimumSize:
                      MaterialStatePropertyAll(Size(70.w, 20.cl(14, 36)))),
              child: Text(
                'Get Started Now',
                style: context.textTheme.labelLarge,
              ),
            ),
          ],
        ).contain(width: 100.w, height: 100.h, padding: 20.cl(18, 46).pdX),
      ),
    );
  }
}
