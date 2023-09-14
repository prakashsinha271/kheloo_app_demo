import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';

class GameView extends StatelessWidget {
  final int gameViewHeight;
  final Map<String, String> initialLanguage;
  final Function(int) toggleGameView;

  const GameView({
    required this.gameViewHeight,
    required this.initialLanguage,
    required this.toggleGameView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  initialLanguage['mostPopular']!,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {
                    // Toggle the game view height
                    // Use a callback to communicate back to the parent widget
                    gameViewHeight == 2
                        ? toggleGameView(4)
                        : toggleGameView(2);
                  },
                  child: gameViewHeight == 2
                      ? Text(initialLanguage['showMore']!)
                      : Text(initialLanguage['showLess']!),
                ),
              ),
            ],
          ),

          /// Cards
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: gameViewHeight,
            itemBuilder: (context, index) {
              final evenIndex = index * 2;
              return CardWidget(
                index: evenIndex,
                text: "${initialLanguage['min']} ₹100k | ${initialLanguage['max']} ₹100k",
              );
            },
          ),
        ],
      ),
    );
  }
}
