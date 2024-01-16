import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './login_page.dart';

class SplashScreenWidget extends StatefulWidget{
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() =>MainSplashScreenState();
  
}



class MainSplashScreenState extends State<SplashScreenWidget> {
 
  @override
  void initState(){
    super.initState();
  }

  
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
          const Text("Real State Consultancy", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              fontSize: 27,
              fontStyle: FontStyle.normal,
              color: Color.fromARGB(179, 19, 18, 18),
              height: 3,
              wordSpacing: 2,
              shadows: [
                BoxShadow(
                  color: Color.fromARGB(255, 133, 129, 129),
                  spreadRadius: 15,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            ),
            Container(margin: const EdgeInsets.symmetric(vertical: 80)),
          // CircularProgressIndicator(),
          const SpinKitRipple(
            color: Colors.purple,
            size: 100.0,
          ),
        ],
      ),
    
    );
  }
}