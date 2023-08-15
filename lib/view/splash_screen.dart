import 'dart:async';

import 'package:covid_19/view/world_states_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  /*
  
  */

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 3,
    ),
  )..repeat();

  @override
  void initState() {
    super.initState();

    myTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void myTimer() {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const WorldStatesScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: Container(
                height: 200,
                width: 200,
                child: const Center(
                  child: Image(
                    image: AssetImage(
                      'assets/images/virus.png',
                      // 'assets/images/splash_screen.png',
                    ),
                  ),
                ),
              ),
              builder: (context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
