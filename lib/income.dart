import 'package:flutter/material.dart';

class Income {
  int id;
  String name;
  String amount;
  String mounth;

  Income({this.name, this.amount, this.mounth});
  Income.withId({this.id, this.name, this.amount, this.mounth});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["amount"] = amount;
    map["mounth"] = mounth;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Income.fromObject(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.amount = o["amount"];
    this.mounth = o["mounth"];
  }
}