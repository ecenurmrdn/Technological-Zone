import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:budget_management/income.dart';
import 'package:budget_management/expense.dart';

class DbHelper {

  var inc;
  var exp;

  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "budget.db");
    var budgetDb = await openDatabase(dbPath, version: 1, onCreate: creatDb);
    return budgetDb;
  }

  void creatDb(Database db, int version) async {
    await db.execute(
        "Create table incomes(id integer primary key,name text,amount integer, mounth text)");
    await db.execute(
        "Create table expenses(id integer primary key,name text,amount integer, mounth text)");
  }

  Future<List<Income>> getIncome() async {
    Database db = await this.db;
    var result = await db.query("incomes");
    return List.generate(result.length, (i) {
      return Income.fromObject(result[i]);
    });
  }

  Future<int> insertIncomes(Income income) async {
    Database db = await this.db;
    var result = await db.insert("incomes", income.toMap());
    return result;
  }

  Future<int> deleteIncomes(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from incomes where id=$id");
    return result;
  }

  Future<int> updateIncomes(Income income) async {
    Database db = await this.db;
    var result = await db.update("incomes", income.toMap(),
        where: "id=?", whereArgs: [income.id]);
    return result;
  }

  Future<List<Expense>> getExpenses() async {
    Database db = await this.db;
    var result = await db.query("expenses");
    return List.generate(result.length, (i) {
      return Expense.fromObject(result[i]);
    });
  }

  Future<int> insertExpenses(Expense expense) async {
    Database db = await this.db;
    var result = await db.insert("expenses", expense.toMap());
    return result;
  }

  Future<int> deleteExpenses(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from expenses where id=$id");
    return result;
  }

  Future<int> updateExpenses(Expense expense) async {
    Database db = await this.db;
    var result = await db.update("expenses", expense.toMap(),
        where: "id=?", whereArgs: [expense.id]);
    return result;
  }

  Future<String> calculateProfit(String month) async {
    Database db = await this.db;
    List<Map<String, Object>> resultIncomes = await db.rawQuery("select sum(mounth) from incomes where amount=$month");
    List<Map<String, Object>> resultExpenses = await db.rawQuery("select sum(mounth) from expenses where amount=$month");
    inc = resultIncomes[0].values.first;
    exp = resultExpenses[0].values.first;
  }

  /*Future<String> calculateProfit1(String month) async {
    Database db = await this.db;
    List<Map<String, Object>> resultExpenses = await db.rawQuery("select sum(mounth) from expenses where amount=$month");
    exp = resultExpenses[0].values.first;
  }*/

}