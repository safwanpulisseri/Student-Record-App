import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/screens/home_screen.dart';
//import 'package:student_details_app/screens/splash%20screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_) => DataBaseProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: ScreenHome(),
    );
  }
}
