import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budget_management/dbHelper.dart';
import 'package:budget_management/expense.dart';
import 'package:budget_management/expenseAdd.dart';
import 'package:budget_management/expenseDetail.dart';

class Expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State {
  DbHelper dbHelper = new DbHelper();
  List<Expense> expenses;
  int expenseCount = 0;

  @override
  void initState() {
    getExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("GİDERLER"),
      ),
      body: buildTodoList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          goToExpenseAdd();
        },
        child: Icon(Icons.add),
        tooltip: "yeni gider ekle",
      ),
    );
  }

  ListView buildTodoList() {
    return ListView.builder(
        itemCount: expenseCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.orange,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text("${position + 1}"),
              ),
              trailing: Container(
                width: 100,
                height: 40,
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        dbHelper.deleteExpenses(expenses[position].id);
                      });
                      initState();
                    },
                  )
                ]),
              ),
              title: Text(this.expenses[position].name),
              subtitle: Text(this.expenses[position].mounth + '₺'),
              onTap: () => goToDetail(this.expenses[position]),
            ),
          );
        });
  }

  void goToExpenseAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExpenseAdd()));
    if (result != null) {
      if (result) {
        getExpense();
      }
    }
  }

  void goToDetail(Expense expense) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ExpenseDetail(expense)));
    if (result != null) {
      if (result) {
        getExpense();
      }
    }
  }

  void getExpense() async {
    var expensesFuture = dbHelper.getExpenses();
    expensesFuture.then((data) {
      setState(() {
        this.expenses = data;
        expenseCount = data.length;
      });
    });
  }


}