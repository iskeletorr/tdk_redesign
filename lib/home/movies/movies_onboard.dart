import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'movies_button.dart';

class MoviesOnboard extends StatefulWidget {
  const MoviesOnboard({super.key});

  @override
  State<MoviesOnboard> createState() => _MoviesOnboardState();
}

class _MoviesOnboardState extends State<MoviesOnboard> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18181b),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Container(
            color: Colors.transparent,
            height: 492.4.h+24.h,
            width: 1.sw,
            child: Image.asset('assets/figma/onboarding.png',fit: BoxFit.cover,),
            // child: SvgPicture.asset('assets/figma/onboard.svg'),
          ),
          SizedBox(height: 27.63.h),
          Container(
            height: 110.h,
            width: 218.w,
            child: Column(
              children: [
                Text(
                  'Onboarding',
                  style: TextStyle(fontSize: 32, color: Colors.white,fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 7.h),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(text: 'Watch everything you want for free!', style: TextStyle(fontSize: 16, color: Colors.white,fontFamily: 'ReadexPro')))
              ],
            ),
          ),
          SizedBox(height: 20.h),
          MoviesButton('Enter now')
        ],
      ),
    );
  }
}


