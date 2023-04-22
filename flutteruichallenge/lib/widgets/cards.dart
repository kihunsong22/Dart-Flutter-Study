import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutteruichallenge/widgets/txt.dart';

class cards extends StatelessWidget {
  final Color color;
  final String textTop, textBottom;
  final int startHour, startMin, endHour, endMin;
  final String participants;

  const cards({
    super.key,
    required this.color,
    required this.textTop,
    required this.textBottom,
    required this.startHour,
    required this.startMin,
    required this.endHour,
    required this.endMin,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    txt(
                      text: startHour.toString(),
                      size: 24,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                    txt(
                      text: startMin.toString(),
                      size: 16,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                    const txt(text: '|', size: 16, color: Colors.black),
                    txt(
                      text: endHour.toString(),
                      size: 24,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                    txt(
                      text: endMin.toString(),
                      size: 16,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    txt(
                      text: textTop,
                      size: 50,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    ),
                    Transform.translate(
                      offset: const Offset(0, -14),
                      child: txt(
                        text: textBottom,
                        size: 50,
                        color: Colors.black,
                        weight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 48,
                ),
                txt(
                  text: participants,
                  size: 12,
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
