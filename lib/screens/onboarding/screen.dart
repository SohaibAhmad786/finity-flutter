import 'package:finity/extension/extension.dart';
import 'package:finity/generated/assets.dart';
import 'package:finity/router/router.dart';
import 'package:finity/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingScreen extends StatefulWidget implements AppRouter {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

  @override
  String path() {
    return '/onboarding';
  }

  @override
  Widget screen() {
    return this;
  }

  @override
  String title() {
    return 'Onboarding';
  }

  @override
  Transition? transition() {
    return null;
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 1;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarOpacity: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: const WelcomeScreen().goto,
            style: ButtonStyle(
                backgroundColor: Colors.white.all, elevation: 0.0.all),
            child: Text(
              'SKIP',
              style: context.textTheme.headlineMedium,
            ),
          ).toRight,
          PageView.builder(
            controller: _pageController,
            itemCount: boards.length,
            pageSnapping: true,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page + 1;
              });
            },
            itemBuilder: (BuildContext context, int position) {
              final board = boards.elementAt(position);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(
                    flex: 3,
                  ),
                  Image.asset(
                    board.illustration,
                    width: 70.w,
                    height: 70.w,
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    board.title,
                    style: context.textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ).paddingSymmetric(
                    horizontal: 20.cl(14, 36),
                  ),
                  const Spacer(),
                  Text(
                    board.description,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              );
            },
          ).expand,
          Row(
            children: [
              Text(
                '$currentIndex/${boards.length}',
                style: context.textTheme.headlineMedium,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  if (currentIndex >= boards.length) {
                    const WelcomeScreen().goto();
                  } else {
                    _pageController.animateToPage(
                      currentIndex++,
                      duration: 400.milliseconds,
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ButtonStyle(
                  fixedSize: Size(40.cl(80, 120), 40.cl(80, 120)).all,
                  shape: RoundedRectangleBorder(borderRadius: 100.sp.brc).all,
                ),
                child: Text('NEXT', style: context.textTheme.labelMedium),
              )
            ],
          ).paddingSymmetric(
            vertical: 30.cl(16, 58),
            horizontal: 20.cl(16, 38),
          )
        ],
      ).contain(width: 100.w, height: 100.h, padding: 20.cl(14, 36).pdX),
    );
  }
}

class Board {
  String title;
  String description;
  String illustration;

  Board({
    required this.title,
    required this.description,
    required this.illustration,
  });
}

final boards = <Board>[
  Board(
    description: 'Running your finances is easier with xyz',
    title: 'Take hold of your finances',
    illustration: Assets.imagesIllustration1,
  ),
  Board(
    title: 'See where your money is going',
    description:
        'Stay on top by effortlessly tracking your subscriptions & bills',
    illustration: Assets.imagesIllustration2,
  ),
  Board(
    title: 'Reach your goals with ease',
    description:
        'Use the smart saving features to manage your future goals and needs',
    illustration: Assets.imagesIllustration3,
  ),
];
