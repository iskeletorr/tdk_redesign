import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'actor.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  GlobalKey<ScaffoldState> gk = GlobalKey();
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: MovieDetail(
    //     detail: Movie(
    //       title: 'Dare Devil',
    //       backgroundAssetPath: 'assets/movie_assets/daredevil.png',
    //       subTitle: '21 October 2012 - 45 min',
    //       isFavorite: false,
    //       rating: 5.0,
    //       desc:
    //           'Daredevil: Matt Murdock, a blind lawyer by day and vigilante by night, tries to protect Hell’s Kitchen with his enhanced abilities as Daredevil outside the system while also trying to live a (somewhat) normal life as a lawyer working within the bounds of the law...',
    //       cast: [
    //         Actor('Charlie Cox', 'assets/movie_assets/JonBernthal.png'),
    //         Actor('Debroah Ann Woll', 'assets/movie_assets/JonBernthal.png'),
    //         Actor('John Berntal', 'assets/movie_assets/JonBernthal.png'),
    //         Actor('Vincent D\'Onofrio', 'assets/movie_assets/JonBernthal.png'),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      key: gk,
      drawer: Drawer(
          backgroundColor: const Color(0xFF2C2C2C),
          width: 228.w,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.only(left: 25.w),
                    height: 175.h,
                    color: const Color(0xFFFFB039),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 68.w, height: 68.h, child: const CircleAvatar()),
                        SizedBox(height: 13.h),
                        Text('Jane Smith', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
              SizedBox(height: 38.h),
              Divider(thickness: 1.sp, color: Color(0xFFFFB039)),
              Container(
                alignment: Alignment.center,
                height: 50.h,
                child: ListTile(
                  contentPadding: EdgeInsets.only(bottom: 11.h),
                  leading: Icon(Icons.favorite_border),
                  title: Text(
                    'Favorite Movies',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
              Divider(thickness: 1.sp, color: Color(0xFFFFB039)),
              drawerRow('Favorite Movies', Icons.favorite_border),
              Divider(thickness: 1.sp, color: Color(0xFFFFB039)),
              drawerRow('Membership', Icons.attach_money_rounded),
              Divider(thickness: 1.sp, color: Color(0xFFFFB039)),
              drawerRow('Share Your Favorites', Icons.share),
              Divider(thickness: 1.sp, color: Color(0xFFFFB039)),
              drawerRow('Settings', Icons.settings),
              Divider(thickness: 1.sp, color: Color(0xFFFFB039)),
              drawerRow('Favorite Movies', Icons.login_rounded),
              Divider(thickness: 1.sp, color: Color(0xFFFFB039)),
              SizedBox(height: 152.h), // top,835 bot,52
              Container(
                width: 180.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xFFFFFB039),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'About us',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    )),
              )
            ],
          )),
      // backgroundColor: const Color(0xFF2C2C2C),
      body: Stack(
        children: [
          ClipRRect(
            child: Stack(
              children: [
                Positioned(
                  top: -20,
                  child: Container(
                    width: 430.w,
                    height: 520.h,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(radius: 0.65.r, center: Alignment.topRight, colors: [
                        Color(0xFFFFAC4A),
                        Color(0xFF2c2c2c),
                      ]),
                    ),
                  ),
                ),
                Positioned(
                  top: 340.h,
                  child: Container(
                    width: 430.w,
                    height: 610.h,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(radius: 0.65.r, center: Alignment.centerLeft, colors: [
                        Color(0xFFFFAC4A),
                        Color(0xFF2C2C2C),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 55, sigmaY:55),
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: ClipRRect(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                          onPressed: () {
                            gk.currentState!.openDrawer();
                          },
                          icon: const Icon(Icons.menu, color: Colors.white)),
                      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.white))],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      trailing: Container(width: 40.w, height: 40.h, child: const CircleAvatar()),
                      title: Text('Hi Jane,', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.white)),
                      subtitle: Text('See what\'s new today', style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                    ),
                    SizedBox(height: 33.h),
                    Text('Latest', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.white)),
                    SizedBox(height: 33.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          movieColumn('', 'Daredevil', '21 October 2012'),
                          SizedBox(width: 30.w),
                          movieColumn('', 'See', '12 July 2016'),
                          SizedBox(width: 30.w),
                          movieColumn('', 'The Boys', '16 July 2015'),
                        ],
                      ),
                    ),
                    SizedBox(height: 56.h),
                    Text('Favorite', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.white)),
                    SizedBox(height: 21.h),
                    Stack(
                      children: [
                        stackMovieContainer('Friends', 'PG | September 22, 1994', '22 mins'),
                        Positioned(right: 27.97.w, child: stackRatingContainer('4.8')),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Stack(
                      children: [
                        stackMovieContainer('Avatar', 'PG | October 20, 2012', '2 hour 15 mins'),
                        Positioned(right: 27.97.w, child: stackRatingContainer('4.9')),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Stack(
                      children: [
                        stackMovieContainer('Friends', '18+ | July 10, 2008', '45 mins'),
                        Positioned(right: 27.97.w, child: stackRatingContainer('4.6')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row drawerRow(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 25.w),
        Icon(
          icon,
          color: const Color(0xFFFFB039),
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
        const Spacer(flex: 3),
        const Icon(Icons.play_arrow),
        SizedBox(width: 11.5.w),
      ],
    );
  }

  Container stackRatingContainer(String rating) {
    return Container(
      width: 33.76.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          color: Color(0xFFFFB039)),
      child: Column(
        children: [
          const Icon(Icons.star, color: Colors.black, size: 16),
          SizedBox(height: 5.75.h),
          Text(rating, style: TextStyle(color: Colors.black, fontSize: 14.sp)),
        ],
      ),
    );
  }

  Container stackMovieContainer(String movie, String date, String duration) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: const Color(0xFF818181).withOpacity(0.3),
      ),
      width: 380.w,
      height: 122.h,
      padding: EdgeInsets.only(left: 16.w, top: 16.h),
      child: Row(children: [
        Container(
          width: 67.51.w,
          height: 90.h,
          child: const Placeholder(),
        ),
        SizedBox(width: 25.08.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp)),
            SizedBox(height: 11.h),
            Text(date, style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold, fontSize: 14.sp)),
            SizedBox(height: 18.h), // 20.h
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  color: Colors.white,
                ),
                SizedBox(width: 6.27.w),
                Text(duration, style: const TextStyle(color: Colors.white)),
              ],
            )
          ],
        )
      ]),
    );
  }

  Column movieColumn(String path, String movieName, String movieDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.r)),
            width: 150.w,
            height: 225.h,
            child: const Placeholder()), // Image.asset(path)
        SizedBox(height: 14.h),
        Text(movieName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 5.h),
        Text(movieDate, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
