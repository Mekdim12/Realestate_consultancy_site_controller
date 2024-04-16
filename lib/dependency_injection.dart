import 'package:get/get.dart';
import 'controller/connectivity_controller.dart';

class DependecyInjection{
  static void init(){
    Get.put<NetworkController>(NetworkController(), permanent: true);
   
  }
}