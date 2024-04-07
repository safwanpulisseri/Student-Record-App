import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_details_app/model/model%20db.dart';

class DataBaseProvider extends ChangeNotifier {
  late Database _db;
  final List<StudentModel> _studentList = [];
  DataBaseProvider() {
    initializeDatabase();
  }
  Future<void> initializeDatabase() async {
    _db = await openDatabase(
      'student_db',
      version: 1,
      onCreate: (Database db, version) async {
        await db.execute(
            'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, classRoom TEXT, guardian TEXT, phone TEXT, image TEXT)');
      },
    );
  }
}
