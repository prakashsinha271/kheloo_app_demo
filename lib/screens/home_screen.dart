import 'dart:async';
import 'package:flutter/material.dart';
import '../components/counter.dart';
import '../components/footer.dart';
import '../components/game_view.dart';
import '../components/gradient_text.dart';
import '../components/header.dart';
import '../components/language_selector.dart';
import '../components/user_section.dart';
import '../components/video_player_section.dart';
import '../constants/constant.dart';
import '../constants/language.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Page Controllers
  final PageController _pageController = PageController();

  /// Time Counters
  Timer? _timer;
  Timer? _counterTimer;

  /// Initial Values
  int counter = 10000;
  int gameViewHeight = 2;
  int currentPage = 0;
  Map<String, String> initialLanguage = langEnglish;

  /// Callback function to handle languages
  void _handleLanguageChange(Map<String, String> newLanguage) {
    setState(() {
      initialLanguage = newLanguage;
    });
  }

  /// Callback function to toggle the game view height
  void _toggleGameView(int height) {
    setState(() {
      gameViewHeight = height;
    });
  }

  @override
  void initState() {
    super.initState();

    /// Start counter
    _startCounter();
  }

  @override
  void dispose() {
    /// Dispose counter and timer
    _cancelCounter();
    _cancelTimer();
    super.dispose();
  }

  /// Method to start and increment the counter
  void _startCounter() {
    _counterTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        counter++;
      });
    });
  }

  /// Method to cancel/stop the counter
  void _cancelCounter() {
    if (_counterTimer != null && _counterTimer!.isActive) {
      _counterTimer!.cancel();
    }
  }

  /// Method to start the timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentPage == 3) {
        currentPage = 0;
      } else {
        currentPage++;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      /// Hold the page for 2 seconds before transitioning
      Future.delayed(const Duration(seconds: 2), () {
        if (_timer != null && _timer!.isActive) {
          _timer!.cancel();
          _startTimer();
        }
      });
    });
  }

  /// Method for cancel/stop the timer
  void _cancelTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  /// Build UI
  @override
  Widget build(BuildContext context) {
    /// Start the timer
    _startTimer();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [

          /// Header
          Header(initialLanguage: initialLanguage),

          /// Center Content (Scrollable)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      /// Slider
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        child: PageView(
                          controller: _pageController,
                          children: [
                            Image.asset('assets/slider1.png'),
                            Image.asset('assets/slider2.png'),
                            Image.asset('assets/slider3.png'),
                            Image.asset('assets/slider4.png'),
                          ],
                        ),
                      ),

                      /// Slider button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              _pageController.animateToPage(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            icon: const Icon(
                              Icons.circle,
                              color: Colors.yellow,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _pageController.animateToPage(1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            icon: const Icon(
                              Icons.circle,
                              color: Colors.yellow,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _pageController.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            icon: const Icon(
                              Icons.circle,
                              color: Colors.yellow,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _pageController.animateToPage(3,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            icon: const Icon(
                              Icons.circle,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Language Section
                  LanguageSelector(
                    initialLanguage: initialLanguage,
                    onLanguageChange: _handleLanguageChange,
                  ),

                  /// Counter
                  CounterWidget(counter: counter),

                  /// Live Withdrawal
                  GradientText(
                    text: initialLanguage['liveWithdrawal']!,
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.yellow.shade50],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(
                      color: Colors.yellow,
                      thickness: 3.0,
                      indent: 100.0,
                      endIndent: 100.0),

                  /// Users
                  UserSectionWidget(
                    userNameText: userNameText,
                    secondsAgoText: secondsAgoText,
                  ),

                  /// Social Video
                  VideoPlayerSection(videoUrl: videoUrl),

                  /// Games
                  GradientText(
                    text: initialLanguage['games']!,
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.yellow.shade50],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(
                    color: Colors.yellow,
                    thickness: 3.0,
                    indent: 100.0,
                    endIndent: 100.0,
                  ),

                  /// Games View
                  GameView(
                    gameViewHeight: gameViewHeight,
                    initialLanguage: initialLanguage,
                    toggleGameView: _toggleGameView,
                  ),
                ],
              ),
            ),
          ),

          /// Footer
          Footer(initialLanguage: initialLanguage)
        ],
      ),
    );
  }
}
