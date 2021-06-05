import 'package:flutter/material.dart';
import 'package:budget_management/constants.dart';
import 'package:budget_management/expenses.dart';
import 'package:budget_management/incomes.dart';
import 'package:budget_management/profits.dart';
import 'package:budget_management/homePage.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                decoration: BoxDecoration(color: Colors.amber),
                child: Column(children: [
                  Image.asset('assets/images/resim2.jpg'),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(250, 50),
              primary: AppConstants.grey),
          child: Text(
            "Ana Sayfa",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(250, 50),
              primary: AppConstants.grey),
          child: Text(
            "Gelirler",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Incomes();
            }));
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(250, 50),
              primary: AppConstants.grey),
          child: Text(
            "Giderler",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Expenses();
            }));
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(250, 50),
              primary: AppConstants.grey),
          child: Text(
            "Aylık Döküm",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Profits();
            }));
          },
        ),
      ),
    ]))));
  }
}
