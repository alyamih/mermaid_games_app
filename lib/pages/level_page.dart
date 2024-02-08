import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mermaid_games_app/pages/home_page.dart';
import 'package:mermaid_games_app/pages/levels_difficulty_page.dart';
import 'package:mermaid_games_app/pages/pause_page.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  int matchedCard = 0;
  @override
  void initState() {
    super.initState();
    game.cards_list.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF3c5454)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 32, 0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 9, 16, 9),
                  decoration: BoxDecoration(
                    color: const Color(0xFF082E2E),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    currentDifficulty == EDifficulty.simple
                        ? 'Normal'
                        : currentDifficulty == EDifficulty.medium
                            ? 'Medium'
                            : 'Hard',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 9, 16, 9),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: Color(0xFF75A2A5)),
                        child: const Text(
                          'Time',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(16, 9, 16, 9),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xFFA2C8C8)),
                          child: const CustomTimer()),
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const PausePage()),
                      );
                    },
                    child: Image.asset('assets/pause.png'))
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: game.currentLevel == 2
                          ? 300
                          : game.currentLevel == 1
                              ? 300
                              : 300,
                      width: game.currentLevel == 2
                          ? 350
                          : game.currentLevel == 1
                              ? 300
                              : 500,
                      child: GridView.builder(
                          itemCount: game.gameImg!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: game.currentLevel == 3
                                ? 7
                                : game.currentLevel == 2
                                    ? 5
                                    : game.currentLevel == 1
                                        ? 4
                                        : 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                          ),
                          padding: const EdgeInsets.all(16.0),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  //incrementing the clicks

                                  game.gameImg![index] = game.cards_list[index];
                                  game.matchCheck
                                      .add({index: game.cards_list[index]});
                                });
                                if (game.matchCheck.length == 2) {
                                  if (game.matchCheck[0].values.first ==
                                      game.matchCheck[1].values.first) {
                                    game.matchCheck.clear();
                                    matchedCard = matchedCard + 2;
                                    if (matchedCard == game.gameImg!.length) {
                                      Future.delayed(
                                          const Duration(milliseconds: 1000),
                                          () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Dialog(
                                                    child: Container(
                                                      width: 500,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFFA2C8C8),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24)),
                                                      child: Column(children: [
                                                        const Text(
                                                          'Level complete',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Indie Flower',
                                                            color: Colors.white,
                                                            fontSize: 32,
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 32),
                                                          child: Text(
                                                            'You’ve passed the level.',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF405F5F),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(
                                                                  MaterialPageRoute<
                                                                          void>(
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          const HomePage()),
                                                                );
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        10,
                                                                        13,
                                                                        10,
                                                                        13),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            26)),
                                                                child:
                                                                    const Text(
                                                                  'Back to menu',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                if (currentDifficulty ==
                                                                    EDifficulty
                                                                        .simple) {
                                                                  game.currentLevel =
                                                                      1;
                                                                } else if (currentDifficulty ==
                                                                    EDifficulty
                                                                        .medium) {
                                                                  game.currentLevel =
                                                                      2;
                                                                } else if (currentDifficulty ==
                                                                    EDifficulty
                                                                        .hard) {
                                                                  game.currentLevel =
                                                                      3;
                                                                }
                                                                game.initCards();
                                                                game.initGame();
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(
                                                                  MaterialPageRoute<
                                                                          void>(
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          const LevelPage()),
                                                                );
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        10,
                                                                        13,
                                                                        10,
                                                                        13),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            26)),
                                                                child:
                                                                    const Text(
                                                                  'Continue',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.of(
                                                                        context)
                                                                    .pushReplacement(
                                                                  MaterialPageRoute<
                                                                          void>(
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          const LevelsDifficulty()),
                                                                );
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        10,
                                                                        13,
                                                                        10,
                                                                        13),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            26)),
                                                                child:
                                                                    const Text(
                                                                  'Change difficulty',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ]),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                        setState(() {});
                                      });
                                    }
                                  } else {
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      setState(() {
                                        game.gameImg![game.matchCheck[0].keys
                                            .first] = game.hiddenCard;
                                        game.gameImg![game.matchCheck[1].keys
                                            .first] = game.hiddenCard;
                                        game.matchCheck.clear();
                                      });
                                    });
                                  }
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/gameIcons/main_icon.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  game.gameImg![index] !=
                                          "assets/gameIcons/main_icon.png"
                                      ? Image.asset(
                                          game.gameImg![index],
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            );
                          })),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomTimer extends StatefulWidget {
  const CustomTimer({super.key});

  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 120;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      if (mounted) {
        setState(() {
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
        });
      }
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timerText,
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
