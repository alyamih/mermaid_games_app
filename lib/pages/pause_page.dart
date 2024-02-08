import 'package:flutter/material.dart';
import 'package:mermaid_games_app/pages/home_page.dart';
import 'package:mermaid_games_app/pages/level_page.dart';
import 'package:mermaid_games_app/pages/levels_difficulty_page.dart';
import 'package:mermaid_games_app/pages/settings_page.dart';

class PausePage extends StatelessWidget {
  const PausePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF3c5454)),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 80, bottom: 30, left: 16, top: 32),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/fish_difficulty.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/back.png')),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const SettingsPage()),
                                );
                              },
                              child: Image.asset('assets/settings.png')),
                          const SizedBox(
                            width: 8,
                          ),
                          Image.asset('assets/sound.png'),
                        ],
                      )
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'PAUSE',
                        style: TextStyle(
                          fontFamily: 'Indie Flower',
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 48,
                        width: 241,
                        decoration: BoxDecoration(
                            color: const Color(0xFF527070),
                            borderRadius: BorderRadius.circular(26)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (currentDifficulty == EDifficulty.simple) {
                          game.currentLevel = 1;
                        } else if (currentDifficulty == EDifficulty.medium) {
                          game.currentLevel = 2;
                        } else if (currentDifficulty == EDifficulty.hard) {
                          game.currentLevel = 3;
                        }
                        game.initCards();
                        game.initGame();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LevelPage()),
                        );
                      },
                      child: Container(
                        height: 48,
                        width: 241,
                        decoration: BoxDecoration(
                            color: const Color(0xFF527070),
                            borderRadius: BorderRadius.circular(26)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Restart',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LevelsDifficulty()),
                        );
                      },
                      child: Container(
                        height: 48,
                        width: 241,
                        decoration: BoxDecoration(
                            color: const Color(0xFF527070),
                            borderRadius: BorderRadius.circular(26)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Levels of difficulty',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                            (route) => false);
                      },
                      child: Container(
                        height: 48,
                        width: 241,
                        decoration: BoxDecoration(
                            color: const Color(0xFF527070),
                            borderRadius: BorderRadius.circular(26)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Main menu',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
