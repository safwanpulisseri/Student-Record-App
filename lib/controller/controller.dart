import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_details_app/model/model_db.dart';

class DataBaseProvider extends ChangeNotifier {
  late Database _db;
  final List<StudentModel> _studentList = [];
  DataBaseProvider() {
    initializeDatabase();
  }
  Future<void> initializeDatabase() async {
    try {
      _db = await openDatabase(
        'student_db',
        version: 1,
        onCreate: (Database db, version) async {
          await db.execute(
              'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, classRoom TEXT, guardian TEXT, phone TEXT, image TEXT)');
        },
      );
      log("Database Created Successfully");
    } catch (e) {
      log('Error initializing database $e'); //add snack bar or notification to show in UI

      await getStudentData(); //initial data retrival
    }
  }

  List<StudentModel> get studentList => _studentList;

  Future<void> getStudentData() async {
    final result = await _db.rawQuery("SELECT * FROM student");
    log('All Student Datas : $result');
    _studentList.clear();
    for (var map in result) {
      final student = StudentModel.fromMap(map);
      _studentList.add(student);
    }
    notifyListeners();
  }

  Future<void> addStudent(StudentModel value) async {
    try {
      await _db.rawInsert(
        'INSERT INTO student(name,classRoom,guardian,phone,image)',
        [value.name, value.classRoom, value.guardian, value.phone, value.image],
      );
      await getStudentData();
      notifyListeners();
    } catch (e) {
      print('Error Inserting Student data $e');
    }
  }
}
