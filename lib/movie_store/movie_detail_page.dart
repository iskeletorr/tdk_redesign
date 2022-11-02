import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0707),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(top: 0, height: 676.h, width: 431.w, child: Image.asset('assets/movie_assets/m1-1.png',fit: BoxFit.fill,)),
          Positioned(
            top: 260.h,
            left: 0,
            child: Container(
              width: 430.w,
              height: 463.h,
              decoration: BoxDecoration(
                // boxShadow: [BoxShadow(color: const Color(0xFFA82C2F).withOpacity(0.1))],
                gradient: RadialGradient(
                  focal: Alignment.bottomCenter,
                    stops: const [0, 0.3, 0.80, 1],
                    radius: 0.75,
                    colors: [
                      const Color(0xFFA82C2F).withOpacity(0.7),
                      const Color(0xFFA82C2F).withOpacity(0.6),
                      const Color(0xFFA82C2F).withOpacity(0.02),
                      Colors.transparent
                    ]),
              ),
            ),
          ),
          Positioned(
              top: 410.h,
              left: -5,
              right: -5,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 333.h,
                  width: 430.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: const [0, 0.15, 0.95],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF0D0707).withOpacity(0.7),
                          const Color(0xFF0D0707).withOpacity(0.6),
                          const Color(0xFF0D0707),
                        ]),
                  ),
                ),
              )),
          Positioned(
            top: 444.h,
            left: 36.w,
            right: 10.w,
            child: bodyColumn(), // width 430, height 488
          ),
        ],
      ),
    );
  }

  Column bodyColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dare Devil',
              style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.favorite_border,
              color: Colors.white,
            )
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          children: [
            Container(
              width: 50.w,
              height: 18.h,
              decoration: BoxDecoration(color: const Color(0xFF006FD5), borderRadius: BorderRadius.circular(3)),
              child: Center(child: Text('13A', style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold))),
            ),
            SizedBox(width: 13.w),
            Text('21 October 2012 - 45 min', style: TextStyle(color: Colors.grey, fontSize: 14.sp))
          ],
        ),
        SizedBox(height: 25.h),
        Row(
          children: [
            ...List.generate(5, (index) {
              return Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  SizedBox(width: 5.w),
                ],
              );
            }),
            SizedBox(width: 10.w),
            Text(
              '5/5 star rating',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            )
          ],
        ),
        SizedBox(height: 14.h),
        RichText(
            text: TextSpan(
                text:
                    'Daredevil: Matt Murdock, a blind lawyer by day and vigilante by night, tries to protect Hell’s Kitchen with his enhanced abilities as Daredevil outside the system while also trying to live a (somewhat) normal life as a lawyer working within the bounds of the law...',
                style: TextStyle(
                  letterSpacing: 1.34.sp,
                  fontSize: 14.sp,
                  color: const Color(0xFF848484),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ))),
        SizedBox(height: 10.h),
        Material(
          color: Colors.transparent,
          child: InkWell(
            child: Text(
              'Read more >',
              style: TextStyle(color: const Color(0xFFFFAC4A), fontSize: 14.sp),
            ),
            onTap: () {},
          ),
        ),
        SizedBox(height: 21.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cast',
              style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 16.w),
            Text(
              'See all',
              style: TextStyle(color: const Color(0xFFFFAC4A), fontSize: 14.sp),
            )
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              width: 60.w,
              height: 106.h,
              child: Column(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    child: Image.asset('assets/movie_assets/JonBernthal.png'),
                  ),
                  SizedBox(height: 4.h),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Charlie Cox',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
