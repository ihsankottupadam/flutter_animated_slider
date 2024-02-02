import 'package:animated_slider/widgets/animated_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textcontroller = TextEditingController();
  double sliderValue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Slider'),
      ),
      body: Column(
        children: [
          AnimatedSlider(
              animationDuration: const Duration(milliseconds: 300),
              value: sliderValue,
              animationCurve: Curves.fastOutSlowIn,
              min: 0,
              max: 10,
              onChanged: (val) {
                setState(() {
                  sliderValue = val;
                });
              }),
          TextField(
            controller: textcontroller,
            keyboardType: TextInputType.number,
            maxLength: 2,
          ),
          ElevatedButton(
              onPressed: () {
                double val = double.parse(textcontroller.text);
                if (val >= 0 && val <= 10) {
                  setState(() {
                    sliderValue = val;
                  });
                }
              },
              child: const Text('change value'))
        ],
      ),
    );
  }
}
