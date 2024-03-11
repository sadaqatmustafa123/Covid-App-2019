import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  _WorldStatesState createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = const <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const PieChart(
                dataMap: {
                  "Total": 20,
                  "Recovered": 13,
                  "Deaths": 2,
                },
                animationDuration: Duration(milliseconds: 1200),
                chartType: ChartType.disc,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .06),
                child: Card(
                  child: Column(
                    children: [
                      reUsableRow(
                        title: 'Total',
                        value: '300',
                      ),
                      reUsableRow(
                        title: 'Total',
                        value: '300',
                      ),
                      reUsableRow(
                        title: 'Total',
                        value: '300',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Center(child: Text('Track any contry')),
                decoration: BoxDecoration(
                  color: const Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class reUsableRow extends StatelessWidget {
  String title, value;
  reUsableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
