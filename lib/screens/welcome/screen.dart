import 'package:finity/extension/extension.dart';
import 'package:finity/generated/assets.dart';
import 'package:finity/router/router.dart';
import 'package:finity/screens/screens.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatefulWidget implements AppRouter {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

  @override
  String path() {
    return '/welcome';
  }

  @override
  Widget screen() {
    return this;
  }

  @override
  String title() {
    return '';
  }

  @override
  Transition? transition() {
    return Transition.rightToLeft;
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            'Welcome',
            style:
                context.textTheme.displaySmall?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ).paddingSymmetric(
            horizontal: 20.cl(14, 36),
          ),
          const Spacer(),
          Text(
            'Stay on top by effortlessly tracking your subscriptions & bills',
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const Spacer(
            flex: 4,
          ),
          TextButton(
            onPressed: const RegisterScreen().goto,
            style: ButtonStyle(
              backgroundColor: Colors.white.all,
              overlayColor: Colors.white.withOpacity(0.1).all,
              fixedSize: Size(40.cl(80, 120), 40.cl(80, 120)).all,
              shape: RoundedRectangleBorder(borderRadius: 100.sp.brc).all,
            ),
            child: Icon(
              Remix.arrow_right_line,
              size: 25.cl(26, 50),
              color: AppTheme.color.primaryColor,
            ),
          ),
          const Spacer(),
        ],
      ).contain(
        width: 100.w,
        height: 100.h,
        padding: 20.cl(18, 30).pdX,
      ),
    );
  }
}
