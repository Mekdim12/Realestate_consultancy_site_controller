
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import './login_page.dart';
import 'package:internet_connection_checker/internet_connection.dart';

class SplashScreenWidget extends StatefulWidget{
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() =>MainSplashScreenState();
  
}

Future<Connectivity> check_internet_connection() async{
  final result =  await Connectivity().checkConnectivity();
  return result;
}


class MainSplashScreenState extends State<SplashScreenWidget> {
  late StreamSubscription subscription;
  late StreamSubscription internetSubscritption;
  bool hasInternet = false;
  @override
  void initState(){
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(_checkInternetConnection);
    internetSubscritption = InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;

      setState(()=> this.hasInternet = hasInternet);
    });
  }

  void _checkInternetConnection(ConnectivityResult result){
    final hasInternet = result != ConnectivityResult.none;
    
  }
  @override
  Widget build(BuildContext context){

    Future<bool> flag = check_internet_connection();

    flag.then((value) => {
          if(hasInternet){
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) {
              return LoginPageWidget();
            }),
          )
          }
        });

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