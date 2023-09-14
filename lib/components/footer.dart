import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Map<String, String> initialLanguage;

  const Footer({required this.initialLanguage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Icon(
            Icons.add_circle,
            color: Colors.yellow,
            size: 36,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                color: Colors.yellow,
                height: 80,
                child: GestureDetector(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(
                        Icons.volume_up_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        initialLanguage['support']!,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(11, 0, 28, 1.0),
                height: 80,
                child: GestureDetector(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(
                        Icons.sports_basketball,
                        color: Colors.white,
                      ),
                      Text(
                        initialLanguage['sports']!,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromRGBO(11, 0, 28, 1.0),
                height: 80,
                child: GestureDetector(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(
                        Icons.money_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        initialLanguage['liveCashino']!,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
                height: 80,
                child: GestureDetector(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      const Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                      Text(
                        initialLanguage['Register']!,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}