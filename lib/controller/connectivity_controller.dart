import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_update_connection_status);
  }

  void _update_connection_status(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        isDismissible: false,
        backgroundColor: const Color.fromARGB(164, 124, 77, 255),
        duration: const Duration(days: 1),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
        messageText: const Center(
          child: Text("Connection to internet is lost",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
