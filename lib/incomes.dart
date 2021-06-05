import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budget_management/dbHelper.dart';
import 'package:budget_management/income.dart';
import 'package:budget_management/incomeAdd.dart';
import 'package:budget_management/incomeDetail.dart';

class Incomes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IncomesState();
  }
}

class _IncomesState extends State {
  DbHelper dbHelper = new DbHelper();
  List<Income> incomes;
  int incomeCount = 0;

  @override
  void initState() {
    getIncome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("GELİRLER"),
      ),
      body: buildTodoList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          goToIncomeAdd();
        },
        child: Icon(Icons.add),
        tooltip: "yeni gelir ekle",
      ),
    );
  }

  ListView buildTodoList() {
    return ListView.builder(
        itemCount: incomeCount,
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
                        dbHelper.deleteIncomes(incomes[position].id);
                      });
                      initState();
                    },
                  )
                ]),
              ),
              title: Text(this.incomes[position].name),
              subtitle: Text(this.incomes[position].mounth + '₺'),
              onTap: () => goToDetail(this.incomes[position]),
            ),
          );
        });
  }

  void goToIncomeAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => IncomeAdd()));
    if (result != null) {
      if (result) {
        getIncome();
      }
    }
  }

  void goToDetail(Income income) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => IncomeDetail(income)));
    if (result != null) {
      if (result) {
        getIncome();
      }
    }
  }

  void getIncome() async {
    var incomesFuture = dbHelper.getIncome();
    incomesFuture.then((data) {
      setState(() {
        this.incomes = data;
        incomeCount = data.length;
      });
    });
  }


}