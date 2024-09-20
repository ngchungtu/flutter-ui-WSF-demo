import 'package:flutter/material.dart';
import 'package:plant_app/models/plants.dart';

class FavoriteProvider extends ChangeNotifier {
  bool isFavorated;
  FavoriteProvider({this.isFavorated = false});

  final List<Plant> _plantList = Plant.plantList;

  // bool _pvdToggleFavor(int index, bool isFavoratedOnParams) {
  //   final item = _plantList[index];
  //   final itemId = _plantList[index].plantId;
  //   print('index(item id): $index');
  //   print('isFavoratedOnParams(item fav stt): $isFavoratedOnParams');
  //   notifyListeners();
  //   return item.plantId == index ? isFavoratedOnParams == true : isFavoratedOnParams == false;
  // }

  bool toggleFavorated(bool isFavorated){
    return !isFavorated;
  }
}
