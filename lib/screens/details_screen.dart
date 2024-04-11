import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';
import 'package:student_details_app/screens/home_screen.dart';
import 'package:student_details_app/screens/update_screen.dart';

class ScreenDetails extends StatelessWidget {
  final Studentmodel studentdetails;

  const ScreenDetails({Key? key, required this.studentdetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text(
          "Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Are you sure you want to delete?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  deleteStudent(studentdetails.id!);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => ScreenHome()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Successfully Deleted'),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(10),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey.shade600,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenUpdate(studentDetails: studentdetails),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit_square,
                      color: Colors.grey.shade600,
                      size: 40,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 220,
                        width: 220,
                        child: studentdetails.image.isNotEmpty
                            ? Image.file(
                                File(studentdetails.image),
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/hero.png',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text(
                    'Name: ${studentdetails.name}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text(
                    'Age: ${studentdetails.age}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text(
                    'Adress: ${studentdetails.address}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text(
                    'Phone: ${studentdetails.mobile}',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
