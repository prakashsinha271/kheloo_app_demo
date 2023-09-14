import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Map<String, String> initialLanguage;

  const Header({required this.initialLanguage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color.fromRGBO(11, 0, 28, 1.0),
      child: Row(
        children: [
          Image.asset("assets/logo.gif"),
          const Spacer(),
          GestureDetector(
            child: Column(
              children: [
                const SizedBox(height: 8),
                Image.asset("assets/promotion_icon.png", width: 30),
                const SizedBox(height: 4),
                Text(
                  initialLanguage['advButton']!,
                  style: const TextStyle(color: Colors.yellow),
                )
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          Container(
            color: Colors.yellow.shade300,
            height: 80,
            padding: const EdgeInsets.all(16),
            child: Center(
                child: Text(
                  initialLanguage['loginButton']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}