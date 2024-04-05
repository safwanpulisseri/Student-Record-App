import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenAdd extends StatelessWidget {
  const ScreenAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Add',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Select Option',
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.camera_alt_rounded,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.image,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Name',
                            suffixIcon: Icon(
                              Icons.abc,
                            )),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.class_,
                          ),
                          hintText: 'Class',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.person_2_rounded,
                          ),
                          hintText: 'Guardian',
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.phone,
                          ),
                          hintText: 'Mobile',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
            )
          ],
        ),
      ),
    );
  }
}
