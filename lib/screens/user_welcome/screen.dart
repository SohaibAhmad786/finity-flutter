import 'package:finity/extension/extension.dart';
import 'package:finity/generated/assets.dart';
import 'package:finity/router/router.dart';
import 'package:finity/screens/screens.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserWelcomeScreen extends StatefulWidget implements AppRouter {
  const UserWelcomeScreen({super.key});

  @override
  State<UserWelcomeScreen> createState() => _UserWelcomeScreenState();

  @override
  String path() {
    return '/user/welcome';
  }

  @override
  Widget screen() {
    return this;
  }

  @override
  String title() {
    return 'Welcome new user';
  }

  @override
  Transition? transition() {
    return Transition.downToUp;
  }
}

class _UserWelcomeScreenState extends State<UserWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.color.primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarOpacity: 0,
        toolbarHeight: 0,
        backgroundColor: AppTheme.color.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: <Widget>[
          const Spacer(
            flex: 3,
          ),
          Image.asset(
            Assets.imagesIllustration4,
            width: 70.w,
            height: 70.w,
            fit: BoxFit.fitWidth,
          ),
          Text(
            'Welcome Michael!',
            style:
                context.textTheme.displaySmall?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ).paddingSymmetric(
            horizontal: 20.cl(14, 36),
          ),
          const Spacer(),
          Text(
            'It seems everything went well and your app is ready to work with you',
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              context.toast(
                  toastMessage: 'Thanks for viewing. ;)',
                  type: ToastSnackBarType.info);
            },
            style: ButtonStyle(
              backgroundColor: Colors.white.all,
              foregroundColor: AppTheme.color.primaryColor.all,
              overlayColor: Colors.white.withOpacity(0.1).all,
            ),
            child: const Text('Get Started'),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ).contain(
        width: 100.w,
        height: 100.h,
        padding: 20.cl(18, 30).pdX,
      ),
    );
  }
}
