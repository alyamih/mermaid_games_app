import 'package:flutter/material.dart';
import 'package:mermaid_games_app/pages/home_page.dart';
import 'package:mermaid_games_app/pages/levels_difficulty_page.dart';
import 'package:mermaid_games_app/pages/show_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/back.png')),
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'SETTINGS',
                        style: TextStyle(
                          fontFamily: 'Indie Flower',
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    InkWell(
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
                              'Share with friends',
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
                                  const ReadTermsOrPrivacyScreenView(
                                    link: 'google.com',
                                  )),
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
                              'Privacy policy',
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
                                  const ReadTermsOrPrivacyScreenView(
                                    link: 'google.com',
                                  )),
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
                              'Terms of use',
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
