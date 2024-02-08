import 'package:flutter/material.dart';

class GameModel {
  List<String>? gameImg;
  int? currentLevel;

  final String hiddenCard = "assets/gameIcons/main_icon.png";
  List<String> cards_list = [];
  int? cardCount;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameImg = List.generate(cardCount!, (index) => hiddenCard);
  }

  void initCards() {
    if (currentLevel == 1) {
      cardCount = 16;
      cards_list = [
        "assets/gameIcons/birds.png",
        "assets/gameIcons/birds.png",
        "assets/gameIcons/boat_2.png",
        "assets/gameIcons/boat_2.png",
        "assets/gameIcons/boats.png",
        "assets/gameIcons/boats.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/fish_2.png",
        "assets/gameIcons/fish_2.png",
        "assets/gameIcons/fish.png",
        "assets/gameIcons/fish.png",
        "assets/gameIcons/mermaid_2.png",
        "assets/gameIcons/mermaid_2.png",
        "assets/gameIcons/mermaid.png",
        "assets/gameIcons/mermaid.png",
      ];
    } else if (currentLevel == 2) {
      cardCount = 20;
      cards_list = [
        "assets/gameIcons/birds.png",
        "assets/gameIcons/birds.png",
        "assets/gameIcons/boat_2.png",
        "assets/gameIcons/boat_2.png",
        "assets/gameIcons/boats.png",
        "assets/gameIcons/boats.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/fish_2.png",
        "assets/gameIcons/fish_2.png",
        "assets/gameIcons/fish.png",
        "assets/gameIcons/fish.png",
        "assets/gameIcons/mermaid_2.png",
        "assets/gameIcons/mermaid_2.png",
        "assets/gameIcons/mermaid.png",
        "assets/gameIcons/mermaid.png",
        "assets/gameIcons/mermaid_3.png",
        "assets/gameIcons/mermaid_3.png",
        "assets/gameIcons/water.png",
        "assets/gameIcons/water.png",
      ];
    } else if (currentLevel == 3) {
      cardCount = 28;
      cards_list = [
        "assets/gameIcons/birds.png",
        "assets/gameIcons/birds.png",
        "assets/gameIcons/boat_2.png",
        "assets/gameIcons/boat_2.png",
        "assets/gameIcons/boats.png",
        "assets/gameIcons/boats.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/chest.png",
        "assets/gameIcons/fish_2.png",
        "assets/gameIcons/fish_2.png",
        "assets/gameIcons/fish.png",
        "assets/gameIcons/fish.png",
        "assets/gameIcons/mermaid_2.png",
        "assets/gameIcons/mermaid_2.png",
        "assets/gameIcons/mermaid.png",
        "assets/gameIcons/mermaid.png",
        "assets/gameIcons/mermaid_3.png",
        "assets/gameIcons/mermaid_3.png",
        "assets/gameIcons/water.png",
        "assets/gameIcons/water.png",
        "assets/gameIcons/mermaid_3.png",
        "assets/gameIcons/mermaid_3.png",
        "assets/gameIcons/mermaid_2.png",
        "assets/gameIcons/mermaid_2.png",
        "assets/gameIcons/boats.png",
        "assets/gameIcons/boats.png",
        "assets/gameIcons/birds.png",
        "assets/gameIcons/birds.png",
      ];
    }
  }
}
