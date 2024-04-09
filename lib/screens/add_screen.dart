import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';
import 'package:student_details_app/screens/home_screen.dart';

String? image;

class ScreenAdd extends StatefulWidget {
  ScreenAdd({super.key});

  @override
  State<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {
  final GlobalKey<FormState> _validation = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();

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
              child: Form(
                key: _validation,
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
                            backgroundImage: image != null
                                ? FileImage(File(image!))
                                : AssetImage('assets/images/hero.png')
                                    as ImageProvider,
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Student Name';
                            }
                            return null;
                          },
                          controller: _namecontroller,
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
                          controller: _agecontroller,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.class_,
                            ),
                            hintText: 'Age',
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Guardian Name';
                            }
                            return null;
                          },
                          controller: _addresscontroller,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.person_2_rounded,
                            ),
                            hintText: 'Address',
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
                          controller: _mobilecontroller,
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
                addStudentClicked(context);
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

  Future<void> addStudentClicked(BuildContext context) async {
    final _name = _namecontroller.text.trim();
    final _age = _agecontroller.text.trim();
    final _address = _addresscontroller.text.trim();
    final _mobile = _mobilecontroller.text.trim();

    if (_validation.currentState!.validate() && image != null) {
      final _student = Studentmodel(
          name: _name,
          age: _age,
          address: _address,
          mobile: _mobile,
          image: image!);
      await addStudent(_student);

      Navigator.of(context).pop();
      clearStudentProfilephoto();
      submitbuttondetailsok(_name);
    } else if (_validation.currentState!.validate() && image == null) {
      submitbuttondetailnotok();
    }
  }

  clearStudentProfilephoto() {
    _namecontroller.text = '';
    _agecontroller.text = '';
    _addresscontroller.text = '';
    _mobilecontroller.text = '';
    setState(() {
      image = null;
    });
  }

  submitbuttondetailsok(data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(10),
        content: Text(
          '${data} Details Added',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  submitbuttondetailnotok() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: const EdgeInsets.all(10),
        content: Text(
          'Please Add Student Identity Photo',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Future<void> getImage(ImageSource source, BuildContext context) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage.path;
      });
    }
  }
}
