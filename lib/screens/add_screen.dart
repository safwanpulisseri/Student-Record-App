import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';
import 'package:student_details_app/screens/home_screen.dart';

class ScreenAdd extends StatelessWidget {
  ScreenAdd({super.key});

  String? imagePath;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _classController = TextEditingController();
  final _guardianController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final databaseProvider = Provider.of<DataBaseProvider>(context);
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
              child: Form(
                key: _formKey,
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
                                      'Select image from...',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              getImage(
                                                  ImageSource.camera, context);
                                              Navigator.of(context).pop();
                                            },
                                            icon: Icon(
                                              Icons.camera_alt_rounded,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              getImage(
                                                  ImageSource.gallery, context);
                                              Navigator.of(context).pop();
                                            },
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
                            backgroundImage:
                                AssetImage('assets/images/hero.png'),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Student Name';
                            }
                            return null;
                          },
                          controller: _nameController,
                          decoration: InputDecoration(
                              hintText: 'Name',
                              suffixIcon: Icon(
                                Icons.abc,
                              )),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Class';
                            }
                            return null;
                          },
                          controller: _classController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.class_,
                            ),
                            hintText: 'Class',
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Guardian Name';
                            }
                            return null;
                          },
                          controller: _guardianController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.person_2_rounded,
                            ),
                            hintText: 'Guardian',
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Phone Number';
                            } else if (value.length != 10) {
                              return 'Please enter ten digits Phone Number';
                            }
                            return null;
                          },
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.phone,
                            ),
                            hintText: 'Phone',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addStudentClicked(context, databaseProvider);
              },
              child: Text(
                'Add',
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

  Future<void> addStudentClicked(
      BuildContext context, DataBaseProvider databaseProvider) async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.toUpperCase();
      final classRoom = _classController.text.toString().trim();
      final guardian = _guardianController.text.toUpperCase();
      final phone = _phoneController.text.toString().trim();

      final studentData = StudentModel(
          name: name,
          classRoom: classRoom,
          guardian: guardian,
          phone: phone,
          image: imagePath!);
      await databaseProvider.addStudent(studentData);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ScreenHome()));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully Added'),
          backgroundColor: Colors.green,
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please Complete All Fields'),
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> getImage(ImageSource source, BuildContext context) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return null;
    }
  }
}
