import 'dart:async';

import 'package:finity/extension/extension.dart';
import 'package:finity/router/router.dart';
import 'package:finity/screens/screens.dart';
import 'package:finity/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class VerificationScreen extends StatefulWidget implements AppRouter {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();

  @override
  String path() {
    return '/auth/verification';
  }

  @override
  Widget screen() {
    return this;
  }

  @override
  String title() {
    return 'Verify your phone number';
  }

  @override
  Transition? transition() {
    return null;
  }
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _verificationCodeController =
      TextEditingController();
  int timeLeft = 0;
  late Timer timer;
  String _otpCode = "";
  bool _isLoadingButton = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\d+', multiLine: true);

  /// get signature code
  Future<void> _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    print("signature: $signature");
  }

  /// listen sms
  void _startListeningSms() {
    SmsVerification.startListeningSms().then((message) {
      setState(() {
        _otpCode = SmsVerification.getCode(message, intRegex);
        _verificationCodeController.text = _otpCode;
        _onOtpCallBack(_otpCode, true);
      });
    });
  }

  void _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
    3.seconds.delay(() {
      const UserWelcomeScreen().goto();
    });
  }

  void _onClickRetry() {
    setState(() {
      timeLeft = 60;
    });
    timer = 1.seconds.interval((timer) => {
          if (timeLeft <= 0)
            timer.cancel()
          else
            setState(() {
              timeLeft -= 1;
            })
        });
    _startListeningSms();
  }

  void _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      _otpCode = otpCode;
      if (otpCode.length == 4 && isAutofill) {
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == 4 && !isAutofill) {
        _isLoadingButton = false;
      }
    });
  }

  void _verifyOtpCode() {
    FocusScope.of(context).requestFocus(FocusNode());
    1.seconds.delay(() {
      setState(() {
        _isLoadingButton = false;
      });
      context.toast(
          toastMessage: "Verification OTP Code $_otpCode Success",
          type: ToastSnackBarType.success);
    });
  }

  @override
  void initState() {
    super.initState();
    timeLeft = 60;
    timer = 1.seconds.interval((timer) => {
          if (timeLeft <= 0)
            timer.cancel()
          else
            setState(() {
              timeLeft -= 1;
            })
        });
    _getSignatureCode();
    _startListeningSms();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    SmsVerification.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: Get.back,
            style: ButtonStyle(
                elevation: 12.cl(10, 20).all,
                padding: 14.cl(14, 24).pdAll.all,
                shape:
                    RoundedRectangleBorder(borderRadius: 14.cl(8, 28).brc).all,
                backgroundColor: Colors.white.all,
                shadowColor: const Color(0xff6F889D).withOpacity(0.10).all),
            icon: Icon(
              Remix.arrow_left_line,
              color: AppTheme.color.textColor,
            ),
          ),
          const Spacer(),
          Text(
            'Verify Code',
            style: context.textTheme.displaySmall,
          ),
          RichText(
            text: TextSpan(
                text: 'Check your SMS inbox, we have sent you the code at ',
                style: context.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '+0 000 000 0000.',
                    style: context.textTheme.headlineMedium,
                  ),
                ]),
          ),
          const Spacer(),
          TextFieldPin(
              textController: _verificationCodeController,
              autoFocus: true,
              codeLength: 4,
              alignment: MainAxisAlignment.center,
              defaultBoxSize: 35.cl(40, 100),
              margin: 10.cl(5, 20),
              selectedBoxSize: 35.cl(40, 100),
              textStyle:
                  context.textTheme.displaySmall?.copyWith(color: Colors.white),
              defaultDecoration: BoxDecoration(
                color: const Color(0xffF5F6FA),
                borderRadius: 14.cl(10, 30).brc,
                border: Border.all(
                  color: AppTheme.color.idealColor.withOpacity(0.2),
                  width: 2.cl(2, 4),
                ),
              ),
              selectedDecoration: BoxDecoration(
                color: AppTheme.color.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.color.primaryColor.withOpacity(0.3),
                    blurRadius: 14.cl(10, 30),
                    offset: Offset(0, 10.cl(8, 18)),
                  )
                ],
                borderRadius: 14.cl(10, 30).brc,
              ),
              onChange: (code) {
                _onOtpCallBack(code, false);
                if (code.length >= 4) {
                  _onSubmitOtp();
                }
              }),
          Gap(20.cl(20, 40)),
          Text(
            '(00:$timeLeft)',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppTheme.color.secondaryColor,
            ),
          ),
          Gap(30.cl(30, 70)),
          Text(
            'This session will end in 60 seconds.',
            style: context.textTheme.bodyMedium,
          ),
          Gap(10.cl(10, 20)),
          RichText(
            text: TextSpan(
                text: 'Didn’t receive a code? ',
                style: context.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: 'Resend Code',
                    recognizer: TapGestureRecognizer()..onTap = _onClickRetry,
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: AppTheme.color.secondaryColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 4.cl(3, 5),
                      decorationColor: AppTheme.color.secondaryColor,
                    ),
                  )
                ]),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ).contain(
        width: 100.w,
        height: 100.h,
        padding: 20.cl(24, 50).pdX.copyWith(
              top: context.mediaQueryPadding.top,
            ),
      ),
    );
  }
}
