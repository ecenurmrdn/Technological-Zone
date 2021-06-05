import 'package:flutter/material.dart';
import 'package:budget_management/dbHelper.dart';
import 'package:budget_management/income.dart';

class IncomeDetail extends StatefulWidget {
  Income income;
  IncomeDetail(this.income);

  @override
  State<StatefulWidget> createState() {
    return _IncomeDetailState(this.income);
  }
}

enum Options { delete, update }

class _IncomeDetailState extends State {
  Income income;
  _IncomeDetailState(this.income);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtAmount = TextEditingController();
  var txtMounth = TextEditingController();

  @override
  void initState() {
    txtName.text = income.name;
    txtAmount.text = income.amount;
    txtMounth.text = income.mounth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("${income.name}"),
      ),
      body: buildIncomeDetail(),
    );
  }

  Widget buildIncomeDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildNameField(),
          buildAmountField(),
          buildMounthField(),
          buildUpdateButton(),
        ],
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
      decoration: InputDecoration(labelText: "Ay(01,02...şeklinde giriniz.)"),
      controller: txtAmount,
    );
  }

  Widget buildMounthField() {
    return TextField(
      decoration: InputDecoration(labelText: "Tutar"),
      controller: txtMounth,
    );
  }

  Widget buildUpdateButton(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: TextButton(
            child: Text("KAYDET",style: TextStyle(color: Colors.white)),
            onPressed: () => updateIncome(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(250, 50),
            ),
          )),
    );
  }


  void updateIncome() async {
    await dbHelper.updateIncomes(Income.withId(
      id: income.id,
      name: txtName.text,
      amount: txtAmount.text,
      mounth: txtMounth.text,
    ));
    Navigator.pop(context, true);
  }

}