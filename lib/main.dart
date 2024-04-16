import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './components/splash_screen.dart';

Future<void> main() async {
  runApp(const MainAppWidget());
}

class MainAppWidget extends StatelessWidget {
  const MainAppWidget({Key? key}) : super(key: key); // Correct this line
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Real State agency Management system",
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const Scaffold(
          body: SplashScreenWidget(),
        ));
  }
}