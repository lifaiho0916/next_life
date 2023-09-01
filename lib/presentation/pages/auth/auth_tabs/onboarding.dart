import "package:flutter/material.dart";
import "package:mylife/presentation/pages/auth/auth_tabs/PathFinderpage.dart";
import "package:mylife/presentation/pages/auth/auth_tabs/age_page.dart";
import "package:mylife/presentation/pages/auth/auth_tabs/enter_name_page.dart";
import "package:mylife/presentation/pages/auth/auth_tabs/profession_page.dart";
import "package:mylife/presentation/pages/auth/auth_tabs/second_tab_page.dart";
import 'package:mylife/presentation/pages/auth/auth_tabs/location_page.dart';
import 'package:onboarding_animation/onboarding_animation.dart';
import "./first_tab_page.dart";

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    Future.delayed(const Duration(seconds: 3), () {
      controller.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });

    Future.delayed(const Duration(seconds: 6), () {
      controller.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: OnBoardingAnimation(
          indicatorDotHeight: 10,
          indicatorDotWidth: 10,
          indicatorActiveDotColor: const Color.fromRGBO(41, 137, 119, 1),
          controller: controller,
          indicatorType: IndicatorType.colourTransitionDots,
          indicatorPosition: IndicatorPosition.bottomCenter,
          pages: [
            const FirstTabPage(),
            const SecondTabPage(),
            EnterNamePage(
              goToNextPage: () {
                controller.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
            AgePage(
              goToNextPage: () {
                controller.animateToPage(
                  4,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
            ZipCodePage(
              goToNextPage: () {
                controller.animateToPage(
                  5,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
            ProfessionPage(
              goToNextPage: () {
                controller.animateToPage(
                  6,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
            const PathFindPage()
          ],
        ),
      ),
    );
  }
}
