import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice_1/home/movies/movies_button.dart';

class MoviesDetail extends StatefulWidget {
  const MoviesDetail({super.key});

  @override
  State<MoviesDetail> createState() => _MoviesDetailState();
}

class _MoviesDetailState extends State<MoviesDetail> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181b),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Column(
          children: [
            Container(
              width: 494.w,
              height: 442.h,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset('assets/figma/morbius.png'),
                  Container(
                     width: 494.w,
              height: 442.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(stops: [0.95,0.98,0.99],begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                        Colors.transparent,
                        Colors.grey.withOpacity(0.2),
                        Colors.grey.withOpacity(0.25),

                      ]),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Morbius',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    SizedBox(height: 3.h),
                    const Text('Marvel Studios', style: TextStyle(fontSize: 12, color: Color(0xFF848484))),
                  ],
                ),
                SizedBox(width: 7.w),
                const Text('2022', style: TextStyle(fontSize: 12, color: Color(0xFF848484))),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  color: Color(0xFFE7C825),
                                ))
                      ],
                    ),
                    SizedBox(height: 2.h),
                    const Text('From 342 users', style: TextStyle(fontSize: 12, color: Color(0xFF848484)))
                  ],
                )
              ],
            ),
            SizedBox(height: 16.h),
            RichText(
                text: const TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex...',
                    style: TextStyle(fontSize: 14, color: Color(0xFF848484), fontFamily: 'ReadexPro'))),
            SizedBox(height: 24.h),
            Row(
              children: [personBox(), SizedBox(width: 16.w), personBox()],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [personBox(), SizedBox(width: 16.w), personBox()],
            ),
            SizedBox(height: 50.h),
            const MoviesButton('Watch now')
          ],
        ),
      ),
    );
  }

  SizedBox personBox() {
    return SizedBox(
      width: 171.w,
      height: 52.h,
      child: Stack(
        children: [
          Positioned(
            // right: 0.w,bottom: 0.h,
            child: Container(
              width: 163.w,
              height: 48.h,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16)),
            ),
          ),
          Positioned(
            left: 0.w,
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  gradient:
                      const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF19A1BE), Color(0xFF7D4192)]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // SizedBox(height: 8.h),
                  Text('Maria Espaes', style: TextStyle(fontSize: 12, color: Colors.white)),
                  Text('As Morbius', style: TextStyle(fontSize: 10, color: Colors.white)),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
