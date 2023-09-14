import 'package:flutter/material.dart';

class UserSectionWidget extends StatelessWidget {
  final List<String> userNameText;
  final String secondsAgoText;

  UserSectionWidget({required this.userNameText, required this.secondsAgoText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Withdrawl-Board_9.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 50,
            child: Column(
              children: List.generate(userNameText.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                        color: Colors.yellow,
                      ),
                      Column(
                        children: [
                          Text(
                            userNameText[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${index + 3} $secondsAgoText",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 30),
                      const Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                        color: Colors.yellow,
                      ),
                      Column(
                        children: [
                          Text(
                            userNameText[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${index + 4} $secondsAgoText",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
