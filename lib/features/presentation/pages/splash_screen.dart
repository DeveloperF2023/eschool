import 'package:eschool_management/core/constants/app_colors.dart';
import 'package:eschool_management/core/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/static/slide_data.dart';
import '../../../core/utils/local/local_service.dart';
import '../widgets/global/widgets_imports.dart';
import '../widgets/splash/widgets_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<SlideData> slidesData = [
      SlideData(
        imagePath: AppAssets.splashStudent,
        title: AppLocalization.of(context)!.translate("slideTitle2"),
      ),
      SlideData(
        imagePath: AppAssets.splashParent,
        title: AppLocalization.of(context)!.translate("slideTitle1"),
      ),
      SlideData(
        imagePath: AppAssets.splashTeacher,
        title: AppLocalization.of(context)!.translate("slideTitle3"),
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.backgroundColorSplash,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .72,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: slidesData.length,
                  itemBuilder: (context, index) {
                    return SlideItem(
                      slideData: slidesData[index],
                      currentIndex: _currentPage,
                      slides: slidesData,
                      pageController: _pageController,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(slidesData.length, (index) {
                  return Container(
                    height: 5,
                    width: index == _currentPage ? 25 : 10,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: index == _currentPage
                            ? AppColors.primaryColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                  );
                }),
              ),
              const SizedBox(
                height: 50,
              ),
              PrimaryButton(
                textButton: "Next",
                isPadding: true,
                onNavigate: () {
                  Navigator.pushNamed(context, AppRoutes.chooseUserType);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
