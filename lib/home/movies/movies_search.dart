import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoviesSearch extends StatefulWidget {
  const MoviesSearch({super.key});

  @override
  State<MoviesSearch> createState() => _MoviesSearchState();
}

class _MoviesSearchState extends State<MoviesSearch> {
  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181b),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 47.h),
          const Text(
            'Search for a content',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 56.h,
            width: 342.w,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF19A1BE), Color(0xFF7D4192)],
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFF18181b)),
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a content.',
                    hintStyle: TextStyle(color: Color(0xFF6C6C6C), fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32.h),
          const Text('Categories', style: TextStyle(color: Colors.white, fontSize: 14)),
          Container(
            // whole box that overflows screen
            width: 421.72.w,
            height: 208.58.h,
            child: Row(children: [
              Stack(
                children: [
                  Positioned(
                    child: ClipPath(
                      clipper: MyClipper(0.w, 148.h, 0, 16.h),
                      child: Container(
                        width: 163.w,
                        height: 148.h,
                        decoration: BoxDecoration(
                            boxShadow: const [
                               BoxShadow(
                        color: Color(0xFF16CAF1),
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                        blurRadius: 1,
                        blurStyle: BlurStyle.inner
                      ),
                      BoxShadow(
                        color: Color(0xFF0143A7),
                        offset: Offset(-1, -1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        blurStyle: BlurStyle.inner
                      ),
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF16CAF1), Color(0xFF0143A7)],
                            ),
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    ),
                  ),
                  Positioned(left: -39.w, child: SvgPicture.asset('assets/figma/spider.svg')),
                  Positioned(
                      left: 102.w,
                      top: 16.h,
                      child: Column(
                        children: const [
                          Text(
                            'Movies',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          Text(
                            '532 Titles',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
                          )
                        ],
                      ))
                ],
              ),
              SizedBox(width: 16.w),
              Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(163.w, 148.h, 163.w, 16.h),
                    child: Container(
                      width: 163.w,
                      height: 148.h,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFFF2E2E), Color(0xFFE08939)],
                          ),
                          borderRadius: BorderRadius.circular(24)),
                    ),
                  ),
                  Positioned(left: 70.w, top: -10.h, child: SvgPicture.asset('assets/figma/spider.svg')),
                  Positioned(
                      left: 16.w,
                      top: 16.h,
                      child: Column(
                        children: const [
                          Text(
                            'Animes',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          Text(
                            '532 Titles',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.white),
                          )
                        ],
                      ))
                ],
              ),
            ]),
          ),
          const Text('Most searched', style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(height: 16.h),
          commonRow(),
          SizedBox(height: 16.h),
          commonRow()
        ],
      ),
    );
  }

  Row commonRow() {
    return Row(
      children: [
        Column(
          children: [
            Container(
              child: SvgPicture.asset('assets/figma/secret.svg'),
            ),
            SizedBox(height: 8.h),
            const Text('Secret Wars', style: TextStyle(color: Colors.white, fontSize: 14)),
            Text('2022', style: TextStyle(color: const Color(0xFF6C6C6C).withOpacity(0.9), fontSize: 14))
          ],
        ),
        SizedBox(width: 16.w),
        Column(
          children: [
            Container(
              child: SvgPicture.asset('assets/figma/samaritan.svg'),
            ),
            SizedBox(height: 8.h),
            const Text('Secret Wars', style: TextStyle(color: Colors.white, fontSize: 14)),
            const Text('2022', style: TextStyle(color: Color(0xFF848484), fontSize: 14))
          ],
        ),
        SizedBox(width: 16.w),
        Column(
          children: [
            Container(
              child: SvgPicture.asset('assets/figma/secret.svg'),
            ),
            SizedBox(height: 8.h),
            const Text('Secret Wars', style: TextStyle(color: Colors.white, fontSize: 14)),
            const Text('2022', style: TextStyle(color: Color(0xFF848484), fontSize: 14))
          ],
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final double startPointX;
  final double startPointY;
  final double goalX;
  final double goalY;
  MyClipper(this.startPointX, this.startPointY, this.goalX, this.goalY);
  @override
  Path getClip(Size size) {
    if (startPointX == 0) {
      double w = size.width;
      double h = size.height;

      Path path = Path();
      path.moveTo(0, h);
      path.lineTo(0, 30);
      path.quadraticBezierTo(0, 10, w / 2 - 35, 8);
      path.quadraticBezierTo(w - 30, 0, w, 0);
      // path.moveTo(startPointX, startPointY);
      // path.lineTo(goalX, goalY);
      // path.lineTo(w, 0);
      path.lineTo(w, h);
      path.close();
      return path;
    } else {
      double w = size.width;
      double h = size.height;

      Path path = Path();
      path.moveTo(w, h);
      path.lineTo(w, 30);
      path.quadraticBezierTo(w, 10, w / 2, 3);
      // path.quadraticBezierTo(0, 0, 0, 0);
      // path.moveTo(startPointX, startPointY);
      // path.lineTo(goalX, goalY);
      path.lineTo(0, 0);

      path.lineTo(0, h);
      path.close();
      return path;
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
