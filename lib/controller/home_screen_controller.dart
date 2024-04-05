import 'dart:developer';

import 'package:sqf_sample_project/model/student_model.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static late Database database;
  static List<Map<String, Object?>> data = [];
  static List<StudentModel> studentList = [];
  //to initalise database
  static Future<void> initDb() async {
    // open the database
    database = await openDatabase('sample.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Student (id INTEGER PRIMARY KEY, name TEXT, phoneNumber INTEGER)');
    });
  }

  static Future addData() async {
    await database.rawInsert(
        'INSERT INTO Student(name, phoneNumber) VALUES(?, ?)',
        ['michelle', 2356788]);
  }

//get all data from database
  static Future getAllData() async {
    data = await database.rawQuery('SELECT * FROM Student');
    studentList = data
        .map((e) => StudentModel(
            id: int.parse(e["id"].toString()),
            name: e["name"].toString(),
            ph: int.parse(e["phoneNumber"].toString())))
        .toList();
    log(data.toString());
  }

  static Future deleteData(var id) async {
    await database.rawDelete('DELETE FROM Student WHERE id = ?', [id]);
    await getAllData();
  }

  static Future updateData(var id) async {
    await database.rawUpdate(
        'UPDATE Student SET name = ?, phoneNumber = ? WHERE id = ?',
        ['angel', 56566266, id]);
    await getAllData();
  }
}
