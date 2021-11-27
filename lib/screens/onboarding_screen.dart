import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';

import 'package:provider/provider.dart';
import 'package:sba_app/sba_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/models.dart';

class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: SbaPages.onboardingPath,
      key: ValueKey(SbaPages.onboardingPath),
      child: const OnboardingScreen(),
    );
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final Color rwColor = kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Empezando'),
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: buildPages()),
            buildIndicator(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: const Text('Skip'),
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false)
                .completeOnboarding();
          },
        )
      ],
    );
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      children: [
        onboardPageView(
          const AssetImage(
              'assets/images/Yuppies - Remote from Living Room.png'),
          '''Descrubre técnicos cerca tuyo''',
        ),
        onboardPageView(
            const AssetImage(
                'assets/images/Yuppies - Remote from Living Room.png'),
            'Contrata a un profesional para lo que necesites'),
        onboardPageView(
            const AssetImage(
                'assets/images/Yuppies - Remote from Living Room.png'),
            'Haz una inspección doméstica de rutina'),
      ],
    );
  }

  Widget onboardPageView(ImageProvider imageProvider, String text) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(activeDotColor: rwColor),
    );
  }
}
