import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  bool isRunning = false;
  bool isOnRest = false;
  late Timer timer;
  List<int> timeList = [15, 20, 25, 30, 35];

  int userSetSeconds = twentyFiveMinutes;
  int curSeconds = twentyFiveMinutes;
  int curRounds = 0;
  int curGoals = 0;

  void onTick(Timer timer) {
    if (curSeconds == 0 && isOnRest == false) {
      isOnRest = true;
      timer.cancel();

      restFiveMinutes();
    } else if (curSeconds == 0 && isOnRest == true) {
      curRounds++;

      curSeconds = userSetSeconds;
      isRunning = false;
      timer.cancel();

      if (curRounds == 4) {
        curRounds = 0;
        curGoals++;

        if (curGoals == 12) {
          curGoals = 0;
        }
      }
    } else {
      curSeconds -= 1;
    }

    setState(() {});
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    isRunning = false;
    setState(() {});
  }

  void resetTimer() {
    timer.cancel();
    curSeconds = userSetSeconds;
    onPausePressed();
  }

  void setMinute(int min) {
    userSetSeconds = min * 60;
    curSeconds = userSetSeconds;
    setState(() {});
  }

  void restFiveMinutes() {
    curSeconds = 5 * 60;
    onStartPressed();
  }

  void setfifteen() => setMinute(15);
  void settwenty() => setMinute(20);
  void settwentyfive() => setMinute(25);
  void setthirty() => setMinute(30);
  void setthirtyfive() => setMinute(35);

  String formatDate(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split('.').first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Flexible(
              flex: 10,
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'POMOTIMER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 8,
            ),
            Flexible(
              flex: 48,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  formatDate(curSeconds),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 18,
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  // child: ShaderMask(
                  //   shaderCallback: (rect) => RadialGradient(
                  //     center: Alignment.center,
                  //     radius: 10,
                  //     colors: [
                  //       Colors.white,
                  //       Theme.of(context).colorScheme.background
                  //     ],
                  //     tileMode: TileMode.clamp,
                  //   ).createShader(rect),
                  // child: Row(
                  //   children: [
                  //     ListView.builder(
                  //       // shrinkWrap: true,
                  //       itemCount: timeList.length,
                  //       itemBuilder: (context, index) {
                  //         return Text(timeList[index].toString());
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.6), width: 3),
                        ),
                        child: TextButton(
                          onPressed: setfifteen,
                          child: const Text(
                            '15',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.6), width: 3),
                        ),
                        child: TextButton(
                          onPressed: settwenty,
                          child: const Text(
                            '20',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.6), width: 3),
                        ),
                        child: TextButton(
                          onPressed: settwentyfive,
                          child: const Text(
                            '25',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.6), width: 3),
                        ),
                        child: TextButton(
                          onPressed: setthirty,
                          child: const Text(
                            '30',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white.withOpacity(0.6), width: 3),
                        ),
                        child: TextButton(
                          onPressed: setthirtyfive,
                          child: const Text(
                            '35',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 35,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(
                        isRunning
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                      ),
                      iconSize: 90,
                      color: Colors.white,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.6), width: 3),
                      ),
                      child: TextButton(
                        onPressed: resetTimer,
                        child: const Text(
                          'RESET',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 18,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '$curRounds/4',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 28,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          'ROUND',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '$curGoals/12',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 28,
                              fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          'GOAL',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
