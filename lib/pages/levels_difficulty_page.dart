import 'package:flutter/material.dart';
import 'package:mermaid_games_app/pages/home_page.dart';
import 'package:mermaid_games_app/pages/level_page.dart';
import 'package:mermaid_games_app/pages/settings_page.dart';

class LevelsDifficulty extends StatefulWidget {
  const LevelsDifficulty({super.key});

  @override
  State<LevelsDifficulty> createState() => _LevelsDifficultyState();
}

class _LevelsDifficultyState extends State<LevelsDifficulty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/difficulty_background.png'))),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 80, bottom: 30, left: 16, top: 20),
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
                                Navigator.of(context).push(
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
                    const Text(
                      'LEVELS OF\nDIFFICULTY',
                      style: TextStyle(
                        fontFamily: 'Indie Flower',
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentDifficulty = EDifficulty.simple;
                        setState(() {});
                      },
                      child: Container(
                        height: 48,
                        width: 241,
                        decoration: BoxDecoration(
                            color: const Color(0xFF527070),
                            borderRadius: BorderRadius.circular(26),
                            border: currentDifficulty == EDifficulty.simple
                                ? Border.all(color: Colors.black, width: 3)
                                : null),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Easy',
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
                        currentDifficulty = EDifficulty.medium;
                        setState(() {});
                      },
                      child: Container(
                        height: 48,
                        width: 241,
                        decoration: BoxDecoration(
                            color: const Color(0xFF527070),
                            borderRadius: BorderRadius.circular(26),
                            border: currentDifficulty == EDifficulty.medium
                                ? Border.all(color: Colors.black, width: 3)
                                : null),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Medium',
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
                        currentDifficulty = EDifficulty.hard;
                        setState(() {});
                      },
                      child: Container(
                        height: 48,
                        width: 241,
                        decoration: BoxDecoration(
                            color: const Color(0xFF527070),
                            borderRadius: BorderRadius.circular(26),
                            border: currentDifficulty == EDifficulty.hard
                                ? Border.all(color: Colors.black, width: 3)
                                : null),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hard',
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
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LevelPage()),
                            (route) => false);
                      },
                      child: Container(
                        height: 48,
                        width: 241,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(26)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start game',
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
