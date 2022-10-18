import 'package:book_app_edspert/Controller/HomepageController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app_edspert/View/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => HomePageController()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomePage())
      );
  }
}
