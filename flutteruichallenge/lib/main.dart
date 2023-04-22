import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1F1F1F),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 5,
            right: 5,
            bottom: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.ac_unit_sharp,
                            color: Colors.white,
                            size: 40,
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 36,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      txt(
                        text: 'Monday 16',
                        size: 18,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            txt(
                              text: 'TODAY',
                              size: 42,
                              color: Colors.white.withOpacity(0.8),
                              weight: FontWeight.w400,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const txt(
                              text: '·',
                              size: 42,
                              color: Colors.purple,
                              weight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            txt(
                              text: '17 18 19 20',
                              size: 42,
                              color: Colors.white.withOpacity(0.4),
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: const [
                    cards(
                      color: Color(0xFFFCF642),
                      textTop: 'DESIGN',
                      textBottom: 'MEETING',
                      startHour: 11,
                      startMin: 30,
                      endHour: 12,
                      endMin: 20,
                      participants: 'ALEX           HELENA           NANA',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    cards(
                      color: Color(0xFF996BD0),
                      textTop: 'DAILY',
                      textBottom: 'PROJECT',
                      startHour: 12,
                      startMin: 35,
                      endHour: 14,
                      endMin: 10,
                      participants:
                          'ME           RICHARD           CIRY           +4',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    cards(
                      color: Color(0XFFC0EE3A),
                      textTop: 'WEEKLY',
                      textBottom: 'PLANNING',
                      startHour: 15,
                      startMin: 00,
                      endHour: 16,
                      endMin: 30,
                      participants: 'DEN           NANA           MARK',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class txt extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  const txt({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    this.weight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
