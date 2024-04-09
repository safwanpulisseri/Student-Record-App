import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';
import 'package:student_details_app/screens/add_screen.dart';
import 'package:student_details_app/screens/details_screen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Student Record',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          )
        ],
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ValueListenableBuilder(
            valueListenable: studentlistNotifier,
            builder: (BuildContext ctx, List<Studentmodel> studentList,
                Widget? child) {
              return GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: studentList.length,
                itemBuilder: (ctx, index) {
                  final data = studentList[index];
                  return GestureDetector(
                    onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ScreenDetails(student: data),
                      //     ),
                      //   );
                    },
                    child: Card(
                      color: Colors.black45,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            backgroundImage: data.image.isNotEmpty
                                ? FileImage(File(data.image))
                                : AssetImage('assets/images/hero.png')
                                    as ImageProvider,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Name: ${data.name}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Age: ${data.age}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenAdd()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
