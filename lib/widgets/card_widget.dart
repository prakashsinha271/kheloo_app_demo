import 'package:flutter/material.dart';
import 'package:kheloo_app/constants/constant.dart';

class CardWidget extends StatelessWidget {
  final int index;
  final String text;

  const CardWidget({
    super.key,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Column(
              children: [
                Image.network(
                  gameImageList[index + 0],
                  width: double.infinity / 2,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Add card content here
          ),
        ),
        Expanded(
          child: Card(
            child: Column(
              children: [
                Image.network(
                  gameImageList[index + 1],
                  width: double.infinity / 2,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Add card content here
          ),
        ),
      ],
    );
  }
}
