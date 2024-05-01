import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../controller/connectivity_controller.dart';

class NoInternetPage extends StatelessWidget {
  final NetworkController _networkController = Get.find<NetworkController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              color: null,
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/tg_main_logo.png'),
                ),
              ),
            ),
            //  load the no_internet gif here from the assets gif

            Image.asset(
              'assets/gif/no_internet.gif',
              width: 300,
              height: 300,
            ),
            ElevatedButton(
              onPressed: () async {

                _networkController
                    .checkCurrentConnection();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh),
                  Text('Refresh'),
                ],
              ),
            ),
            Container(margin: EdgeInsets.symmetric(vertical: 25),),
            const SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    '❌ No Internet Connection ❌',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
