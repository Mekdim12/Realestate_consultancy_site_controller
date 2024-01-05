import 'package:flutter/material.dart';
import './components/splash_screen.dart';
import './components/login_page.dart';
void main() {
  runApp(const MainAppWidget());
}

class MainAppWidget extends StatelessWidget{
  const MainAppWidget({super.key});
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Real State ageny Management system",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
       home: Scaffold(
        body: LoginPageWidget(),
       )
    );
  }
}