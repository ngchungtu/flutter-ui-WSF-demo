import 'package:flutter/material.dart';
import 'package:plant_app/models/plants.dart';

class FavoriteProvider extends ChangeNotifier {
  bool isFavorated;
  FavoriteProvider({this.isFavorated = false});

  final List<Plant> _plantList = Plant.plantList;

  bool pvdToggleFavor(int index) {
    final item = _plantList[index];
    final itemId = _plantList[index].plantId;
    print('index: $index');
    notifyListeners();
    return item.plantId == index ? isFavorated == true : isFavorated == false;
  }

  bool checkLog(bool defaultFavorited) {
    // print('defaultFavorited: $defaultFavorited');
    isFavorated = !defaultFavorited;
    print('isFavorated: $isFavorated');
    return !defaultFavorited;
  }
}
