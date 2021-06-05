import 'package:flutter/material.dart';
import 'package:budget_management/dbHelper.dart';
import 'package:budget_management/expense.dart';

class ExpenseDetail extends StatefulWidget {
  Expense expense;
  ExpenseDetail(this.expense);

  @override
  State<StatefulWidget> createState() {
    return _ExpenseDetailState(this.expense);
  }
}

enum Options { delete, update }

class _ExpenseDetailState extends State {
  Expense expense;
  _ExpenseDetailState(this.expense);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtAmount = TextEditingController();
  var txtMounth = TextEditingController();

  @override
  void initState() {
    txtName.text = expense.name;
    txtAmount.text = expense.amount;
    txtMounth.text = expense.mounth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("${expense.name}"),
      ),
      body: buildExpenseDetail(),
    );
  }

  Widget buildExpenseDetail() {
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
      decoration: InputDecoration(labelText: "Gider Açıklaması"),
      controller: txtName,
    );
  }

  Widget buildAmountField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ay(01,02..şeklinde giriniz)"),
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
            onPressed: () => updateExpense(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(250, 50),
            ),
          )),
    );
  }


  void updateExpense() async {
    await dbHelper.updateExpenses(Expense.withId(
      id: expense.id,
      name: txtName.text,
      amount: txtAmount.text,
      mounth: txtMounth.text,
    ));
    Navigator.pop(context, true);
  }

}