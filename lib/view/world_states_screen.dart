import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
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
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              const PieChart(
                dataMap: {
                  'Total': 20,
                  'Recovered': 15,
                  'Deaths': 5,

                  // "Total" : double.parse(snapshot.data!.cases.toString()),
                  // "Recovered" : double.parse(snapshot.data!.recovered.toString()),
                  // "Deaths" : double.parse(snapshot.data!.deaths.toString()),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
