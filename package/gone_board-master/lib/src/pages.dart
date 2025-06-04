import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:gone_board/src/app_color.dart';

import 'package:starsview/starsview.dart';

class GonePage {
  final BuildContext context;
  final String image;
  final String text;
  final String text2;
  final Color color;

  GonePage(
      {required this.context,
      required this.image,
      required this.text,
      required this.text2,
      required this.color});

  Widget build() {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.fromLTRB(16, 80, 16, 20),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const StarsView(
            fps: 60,
          ),
          Positioned(
            bottom: 60,
            child: Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  text2,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
          Image.asset(
            image,
            width: 300,
            height: 300,
          ).animate().moveY(
              begin: 120, end: 0, duration: const Duration(milliseconds: 600)),
        ],
      ),
    );
  }
}
