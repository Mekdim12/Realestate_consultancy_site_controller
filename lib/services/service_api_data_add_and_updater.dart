// import json and http package
import 'package:http/http.dart' as http;
import '../models/properties.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class ApiDataUploaderAndUpdater {
  Future addPropertyVehiclesData(
      String nameOfTheCar,
      String color,
      String plateNumberCity,
      String description,
      String unitsAvailabel,
      String price,
      String usedOrNew,
      String status,
      List vehicleImage) async {
    Dio dio = Dio();

    Uri url = Uri.parse('http://localhost:8000/api/property/vehicle');

    List<MultipartFile> multipartFiles =
        await Future.wait(vehicleImage.map((image) async {
      return MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last);
    }));

    FormData formData = FormData.fromMap({
      'name_of_the_car': nameOfTheCar,
      'color': color,
      'plate_number_city': plateNumberCity,
      'description': description,
      'units_available': unitsAvailabel,
      'price': price,
      'used_or_new': usedOrNew,
      'status': status,
      'vehicle_image': multipartFiles
    });

    final response = await dio.post(url.toString(), data: formData);
    if (response.statusCode == 200) {
      print('Data added successfully');
    } else {
      print('Failed to add data');
    }
  }
}
