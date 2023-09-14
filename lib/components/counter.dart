import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int counter;

  CounterWidget({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/jackpot.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 60,
            left: 70,
            child: Center(
              child: Text(
                counter.toString().padLeft(7, "0"),
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 23.0,
                  fontSize: 40,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3, 3),
                      color: Colors.black,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
