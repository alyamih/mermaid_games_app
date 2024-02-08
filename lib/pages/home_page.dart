import 'package:flutter/material.dart';
import 'package:mermaid_games_app/model/game.dart';
import 'package:mermaid_games_app/pages/level_page.dart';
import 'package:mermaid_games_app/pages/levels_difficulty_page.dart';
import 'package:mermaid_games_app/pages/settings_page.dart';

enum EDifficulty { simple, medium, hard }

EDifficulty currentDifficulty = EDifficulty.simple;
GameModel game = GameModel();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/background.png'))),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
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
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Main menu',
                            style: TextStyle(
                              fontFamily: 'Indie Flower',
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              currentDifficulty = EDifficulty.simple;
                              if (currentDifficulty == EDifficulty.simple) {
                                game.currentLevel = 1;
                              } else if (currentDifficulty ==
                                  EDifficulty.medium) {
                                game.currentLevel = 2;
                              } else if (currentDifficulty ==
                                  EDifficulty.hard) {
                                game.currentLevel = 3;
                              }
                              game.initCards();
                              game.initGame();
                              Navigator.of(context).push(
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
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
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
                        ]),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            left: 100,
            child: Text(
              'CUTE\nMERMAID',
              style: TextStyle(
                fontFamily: 'Indie Flower',
                color: Colors.white,
                fontSize: 64,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
