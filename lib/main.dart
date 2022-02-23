import 'package:camera/camera.dart';
import 'package:chat_app/modules/camera_screen/camera_layout.dart';
import 'package:chat_app/modules/home_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(backgroundColor: const Color(0xFF075E54)),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF128C7E)),
      ),
      home: HomeScreen(),
    );
  }
}
