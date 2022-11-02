import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {});
    });
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            right: 0,
            child: Container(
                color: Colors.transparent,
                child: SvgPicture.asset(
                  'assets/mindfulness.svg',
                )),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  Expanded(child: ClipPath(clipper: MyClipper(), child: pageViewBuilder())),
                ],
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.86,
            left: 40,
            right: 0,
            bottom: 50,
            child: Row(
              children: [
                Expanded(child: avatar()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PageView pageViewBuilder() {
    return PageView.builder(
      controller: pageController,
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        color: Colors.blue.shade700,
        padding: EdgeInsets.all(38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            const Text(
              'Easy Collaborate',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 35),
            RichText(
                text: const TextSpan(
                    text: 'High-quality illustration pack, suitable for presentation, website and all needs.',
                    style: TextStyle(color: Colors.white54, fontSize: 18))),
            const SizedBox(height: 35),
            Container(
              width: 130,
              height: 40,
              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  onPressed: () {
                    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  ListView avatar() => ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 6),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        print('$index -- ${pageController.page!.toInt()}');
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: CircleAvatar(
            backgroundColor: pageController.page!.round() == index ? Colors.white : Colors.white24,
            radius: pageController.page!.round() == index ? 6 : 4,
          ),
        );
      });
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path();
    path.moveTo(0, h);
    path.lineTo(0, 10);
    path.quadraticBezierTo(55, -10, (w / 2) - 40, 10);
    path.quadraticBezierTo((w / 2) + 200, 60, w, 12);

    path.lineTo(w, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
