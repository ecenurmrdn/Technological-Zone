import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budget_management/dbHelper.dart';
import 'package:budget_management/income.dart';


class IncomeAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IncomeAddState();
  }
}

class IncomeAddState extends State {
  var dbHelper = DbHelper();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtMounth = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Yeni Gelir Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildAmountField(),
            buildMounthField(),
            //buildUnitPrice(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Gelir Açıklaması"),
      controller: txtName,
    );
  }

  Widget buildAmountField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ay (01,02..şeklinde giriniz.)"),
      controller: txtAmount,
    );
  }

  Widget buildMounthField() {
    return TextField(
      decoration: InputDecoration(labelText: "Tutar"),
      controller: txtMounth,
    );
  }

  Widget buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TextButton(
          child: Text("KAYDET",style: TextStyle(color: Colors.white)),
          onPressed: () => addIncome(),
          style: TextButton.styleFrom(
      backgroundColor: Colors.green,
      minimumSize: Size(250, 50),
        ),
      )),
    );
  }

  void addIncome() async {
    await dbHelper.insertIncomes(Income(
      name: txtName.text,
      mounth: txtAmount.text,
      amount: txtMounth.text
    ));
    Navigator.pop(context, true);
  }
}