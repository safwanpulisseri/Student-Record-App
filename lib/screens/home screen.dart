import 'package:flutter/material.dart';
import 'package:student_details_app/screens/add%20screen.dart';
import 'package:student_details_app/screens/details%20screen.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 5,
            itemBuilder: (context, _) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScreenDetails()));
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
                        backgroundImage: AssetImage('assets/images/hero.png'),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Name',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Class',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
              context, MaterialPageRoute(builder: (context) => ScreenAdd()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
