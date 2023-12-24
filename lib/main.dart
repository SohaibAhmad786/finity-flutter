import 'package:finity/router/router.dart';
import 'package:finity/screens/screens.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ScreenType;
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation,
          ScreenType screenType) {
        return GetMaterialApp(
          title: 'Finite Bank',
          debugShowCheckedModeBanner: false,
          initialRoute: const LaunchScreen().path(),
          popGesture: GetPlatform.isIOS,
          defaultTransition:
              GetPlatform.isIOS ? Transition.rightToLeft : Transition.downToUp,
          scrollBehavior: const CupertinoScrollBehavior(),
          themeMode: ThemeMode.light,
          theme: AppTheme.theme,
          getPages: <GetPage>[
            const LaunchScreen().page(),
            const OnboardingScreen().page(),
            const WelcomeScreen().page(),
            const RegisterScreen().page(),
            const RegisterPhoneNumberScreen().page(),
          ],
        );
      },
    );
  }
}
