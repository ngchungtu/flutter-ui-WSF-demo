import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {

  bool isFavorated = false;

  void toggleFavorated(index) {
    print('index: $index');
    return index;
  }

  bool handleRecieve(bool fav, String name, int id){
    print('plaat name is ${name}, with id ${id}, fav: ${fav}');
    if(fav == false && name != '' && id > -1 ) {
      fav = !isFavorated;
      notifyListeners();
    }
    isFavorated = fav;
    print('isFavorated: $isFavorated');
    return isFavorated;
  }
}
