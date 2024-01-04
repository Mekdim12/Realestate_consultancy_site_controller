
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatefulWidget{
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() =>MainSplashScreenState();
  
}

class MainSplashScreenState extends State<SplashScreenWidget> {
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: 250,
            height: 250,
            color: null,
            margin:const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/tg_main_logo.png'),
                ),
           )    
          ),
          const Text("Real State Consultancy", style: TextStyle(fontSize: 20, color: Colors.purple, fontWeight: FontWeight.bold),)
        ],
      ),
    
    );
  }
}