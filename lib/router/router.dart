import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppRouter {
  @protected
  String path() {
    throw Exception("unimplemented");
  }

  @protected
  String title() {
    throw Exception("unimplemented");
  }

  @protected
  Transition? transition() {
    return null;
  }

  @protected
  Widget screen() {
    throw Exception("unimplemented");
  }
}

extension f on AppRouter {
  GetPage page() {
    return GetPage(
      name: path(),
      page: screen,
      title: title(),
      transition: transition() ??
          (GetPlatform.isAndroid
              ? Transition.rightToLeft
              : Transition.downToUp),
    );
  }

  String _redirect() {
    // final authController = AuthController.to;
    // final profileController = ProfileController.to;
    // if (path().contains('auth')) {
    //   if (profileController.profile == null) {
    //     return path();
    //   } else {
    //     return const DashboardScreen().path();
    //   }
    // } else if (path().contains('on_boarding')) {
    //   if (authController.auth.value == null) {
    //     return path();
    //   } else {
    //     return const LoadingScreen().path();
    //   }
    // } else {
    return path();
    // }
  }

  void goto({
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    Get.toNamed(path(),
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters);
  }

  void startAt() {
    Get.offAllNamed(_redirect());
  }

  void replace() {
    Get.replace(_redirect());
  }

  void stepBackandTo({
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    Get.offAndToNamed(_redirect(),
        arguments: arguments, id: id, parameters: parameters);
  }

  void stepBackUntil(
    bool Function(Route<dynamic>) route, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    Get.offNamedUntil(_redirect(), route,
        arguments: arguments, id: id, parameters: parameters);
  }

  void openBottomSheet() {
    Get.bottomSheet(
      screen(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.sp),
        ),
      ),
      ignoreSafeArea: true,
      backgroundColor: const Color(0xffDAEBDA),
      elevation: 10,
      barrierColor: Colors.black.withOpacity(0.2),
    );
  }
}
