import 'dart:async';

import 'package:covid_with_api/view/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
// with tickerproviderstaetmixin help to build animations
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const worldStatesScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image(image: AssetImage("images/virus.png")),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  " Covid-19\n Tracker App ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  " Developed By \n M Sameer Un Nabi \n Usman Siddique \n Farah Ilyass \n Manal Saba",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                )),
          ],
        ),
      ),
    );
  }
}
