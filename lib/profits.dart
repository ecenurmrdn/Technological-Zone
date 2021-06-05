import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budget_management/dbHelper.dart';
import 'package:budget_management/income.dart';


class Profits extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfitsState();
  }
}

class ProfitsState extends State {
  var toplamGelir;
  var toplamGider;
  var profit;
  var strProfit;
  var dbHelper = DbHelper();
  TextEditingController txtMounth = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("BÜTÇE DÖKÜMÜ"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildMounthField(),
            //buildUnitPrice(),
            buildCalculateButton(),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(width: 300,height: 50,child: Center(child: Text('TOPLAM AYLIK GELİR: $toplamGelir'+ '₺', textAlign: TextAlign.center)), color: Colors.amber),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(width: 300,height: 50,child: Center(child: Text('TOPLAM AYLIK GİDER: $toplamGider'+ '₺', textAlign: TextAlign.center)), color: Colors.amber),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(width: 300,height: 50,child: Center(child: Text('TOPLAM KAR/ZARAR: $strProfit'+ '₺', textAlign: TextAlign.center)), color: Colors.orange),
            ),
          ],

        ),
      ),
    );
  }

  Widget buildMounthField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ay(01,02..şeklinde giriniz.)"),
      controller: txtMounth,
    );
  }

  Widget buildCalculateButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: TextButton(
            child: Text("Dökümü Göster",style: TextStyle(color: Colors.white)),
            onPressed: () => Calculate(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(250, 50),
            ),
          )),
    );
  }

  Calculate(){
    dbHelper.calculateProfit(txtMounth.text);
    setState(() {
      toplamGelir = dbHelper.inc;
      toplamGider = dbHelper.exp;
      profit = toplamGelir - toplamGider;
      strProfit = profit.toString();
    });
  }
}