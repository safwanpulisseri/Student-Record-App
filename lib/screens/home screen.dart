import 'package:flutter/material.dart';
import 'package:student_details_app/screens/add%20screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ScreenAdd()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
