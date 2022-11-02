import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Movie {
  final String title;
  final String backgroundAssetPath;
  final bool isFavorite;
  final String subTitle;
  final double rating;
  final String desc;
  final List<Actor> cast;
  Movie({
    required this.title,
    required this.backgroundAssetPath,
    required this.isFavorite,
    required this.subTitle,
    required this.rating,
    required this.desc,
    required this.cast,
  });
}

class Actor {
  final String name;
  final String imagePath;

  Actor(this.name, this.imagePath);
}

class MovieDetail extends StatelessWidget {
  final Movie detail;
  const MovieDetail({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 694.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: 732.h,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(detail.backgroundAssetPath),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 333.h,
                  child: details(),
                ),
                Positioned(
                  left: 36.w,
                  top: 43.h,
                  height: 34.w,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/movie/arrow-back.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 238.h,
            child: bottom(),
          ),
        ],
      ),
    );
  }

  Container details() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r),
          topLeft: Radius.circular(50.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFA82C2F).withOpacity(0.25),
            const Color(0xFF0D0707).withOpacity(0.5),
          ],
          stops: const [0.358, 0.65],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(36.w, 54.h, 53.w, 31.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  detail.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                  size: 30.w,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 36.w),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: const Color(0xFF006FD5),
                  ),
                  alignment: Alignment.center,
                  child: Text('13A',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.white)),
                ),
                SizedBox(width: 13.w),
                Text(
                  detail.subTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 36.w, top: 23.h),
            child: Row(
              children: [
                ...List.generate(
                    5,
                    (index) => Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Icon(
                            detail.rating > index
                                ? Icons.star
                                : Icons.star_outline,
                            size: 15.w,
                            color: Colors.white,
                          ),
                        )),
                SizedBox(width: 10.w),
                Text("${detail.rating}/5 star rating",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.grey[500])),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(39.w, 14.h, 44.w, 0),
            child: Text(
              detail.desc,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[500],
                  height: 1.34,
                  letterSpacing: 1.34),
            ),
          )
        ],
      ),
    );
  }

  Container bottom() {
    return Container(
      color: const Color(0xFF0D0707),
      child: Padding(
        padding: EdgeInsets.only(left: 36.w, right: 34.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 21.h),
              child: GestureDetector(
                onTap: (() {}),
                child: Text(
                  'Read more >',
                  style: TextStyle(
                      color: const Color(0xFFFFAC4A),
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cast',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(79.w, 21.h)),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(left: 1.w)),
                  ),
                  child: const Text(
                    'See all',
                    style: TextStyle(color: Color(0xFFFFAC4A)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                detail.cast.length,
                (index) {
                  final actor = detail.cast.elementAt(index);
                  return SizedBox(
                    height: 106.h,
                    width: 60.w,
                    child: Column(
                      children: [
                        Image.asset(
                          actor.imagePath,
                          width: 60.w,
                          height: 60.h,
                        ),
                        SizedBox(height: 4.h),
                        Flexible(
                          child: Text(
                            actor.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                height: 1.5),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
