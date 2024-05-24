import 'dart:io';
import 'package:flutter/foundation.dart';
import '../class/asin.dart';
import '../class/Coffee.dart';
import '../class/recourses.dart';
import '../class/Enums.dart';
import '../pages/CoffeeMaker.dart';

class Machine {
  final Resources res;
  Machine(this.res);
  ICoffee? ctype;
  ICoffee cof(ICoffee val) {
    return ctype = val;
  }

  bool isAvailableResource() {
    if (res.coffeBeans >= ctype!.coffeBeans() &&
        res.water >= ctype!.water() &&
        res.milk >= ctype!.milk() &&
        res.cash >= ctype!.cash()) {
      return true;
    }
    return false;
  }

  Future<void> subatractResouces() async {
    int coffeBeans = ctype!.coffeBeans();
    res.subCoffeBeans(coffeBeans);
    int water = ctype!.water();
    res.subWater(water);
    int milk = ctype!.milk();
    res.subMilk(milk);
    int cash = ctype!.cash();
    res.subCash(cash);
    return;
  }

  bool makeCoffeeType(String? type) {
    type = type!.toLowerCase();
    switch (type) {
      case 'americano':
        cof(CoffeAmericano());
        if (!isAvailableResource()) {
          return false;
        }
        subatractResouces();
        break;
      case 'espresso':
        cof(CoffeEspresso());
        if (!isAvailableResource()) {
          return false;
        }
        subatractResouces();
        break;
      case 'cappucino':
        cof(CoffeCappucino());
        if (!isAvailableResource()) {
          return false;
        }
        subatractResouces();
        break;
    }
    res.addMilk(0);
    return true;
  }
}
