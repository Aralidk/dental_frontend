

import 'package:flutter/material.dart';

class PriceProvider extends ChangeNotifier{
  List<double> prices = [];

  void addPrice(price){
    prices.add(price);
    notifyListeners();
  }

}