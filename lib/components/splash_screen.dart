import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';
import './login_page.dart';
import 'package:http/http.dart' as http;

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => MainSplashScreenState();
}

class MainSplashScreenState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    _checkInternetConnectivity();
    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.none) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text("No internet connection"),
    //       ),
    //     );
    //   } else {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => LoginPageWidget()),
    //     );
    //   }
    // });
  }

  void _checkInternetConnectivity() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/home'));
      if (response.statusCode == 200) {
        // Internet connection is available, navigate to the login page
        // even the server is running and working give at lease 3 second on this page before navigating to the login page
        await Future.delayed(const Duration(seconds: 3));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPageWidget()),
        );
      } else {
        // If the server returns a 404 or other non-200 status code, show a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No internet connection"),
          ),
        );
      }
    } catch (e) {
      // If the request throws an exception, show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: const Duration(seconds: 10),
          content: Text("No internet connection or your server is down"),
        ),
      );
    }
  }

  // void _checkInternetConnectivity() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("No internet connection"),
  //       ),
  //     );
  //   } else {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginPageWidget()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          Container(
              width: screenwidth * 0.5,
              height: screenHeight * 0.3,
              color: null,
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/tg_main_logo.png'),
                ),
              )),
          const Text(
            "Real State Consultancy",
            style: TextStyle(
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
          Container(margin: EdgeInsets.symmetric(vertical: screenHeight * 0.1)),
          SpinKitRipple(
            color: Colors.purple,
            size: screenHeight * 0.1,
          ),
        ],
      ),
    );
  }
}
