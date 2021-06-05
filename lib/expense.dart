import 'package:flutter/material.dart';

class Expense {
  int id;
  String name;
  String amount;
  String mounth;

  Expense({this.name, this.amount, this.mounth});
  Expense.withId({this.id, this.name, this.amount, this.mounth});

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

  Expense.fromObject(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.amount = o["amount"];
    this.mounth = o["mounth"];
  }
}