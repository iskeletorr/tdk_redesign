import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_1/home/movies/movies_search.dart';

class MoviesButton extends StatelessWidget {
  final String text;
  const MoviesButton(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: 211.w,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: 0.w,
            top: 0.h,
            child: Container(
              height: 42.h,
              width: 105.5.w,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF19A1BE),
                      offset: Offset(-8, 0),
                      spreadRadius: 1,
                      blurRadius: 32,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 55, 97, 151),
                      offset: Offset(20, 0),
                      spreadRadius: 1,
                      blurRadius: 32,
                    ),
                  ],
                  border: Border.all(color: Colors.transparent),
                  gradient: RadialGradient(
                    // begin: Alignment.centerLeft,
                    // end: Alignment.centerRight,
                    colors: [Color(0xFF19A1BE), Color.fromARGB(255, 55, 97, 151).withOpacity(0.3)],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
            ),
          ),
          Positioned(
            left: 105.5.w,
            child: Container(
              height: 42.h,
              width: 105.5.w,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 55, 97, 151),
                      offset: Offset(-20, 0),
                      spreadRadius: 1,
                      blurRadius: 32,
                    ),
                    BoxShadow(
                      color: Color(0xFF7D4192),
                      offset: Offset(16, 0),
                      spreadRadius: 1,
                      blurRadius: 32,
                    ),
                  ],
                  border: Border.all(color: Colors.transparent),
                  // gradient: LinearGradient(
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  //   colors: [
                  //     // Color.fromARGB(255, 55, 97, 151),
                  //     Color(0xFF7D4192).withOpacity(0.2),

                  //     Color(0xFF7D4192),
                  //   ],
                  // ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
          ),
          Positioned(
            left: 2.w,
            right: 2.w,
            top: 2.h,
            bottom: 2.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviesSearch(),
                            ));
                      },
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
