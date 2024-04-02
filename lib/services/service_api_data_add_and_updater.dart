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
      return response.data;
    } else {
      return false;
    }
  }

  Future addRealestatePropertyData(
      String city,
      String subcity,
      String descritpion,
      String unitsAavilabel,
      String neighborhoodOrStreetName,
      String buildingFloors,
      String pricePerSqfeet,
      String numberOfBedRooms,
      String status,
      String realestateName,
      List listOfImages) async {
    Dio dio = Dio();

    Uri url = Uri.parse('http://localhost:8000/api/property/realestate');

    List<MultipartFile> multipartFiles =
        await Future.wait(listOfImages.map((image) async {
      return MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last);
    }));

    FormData formData = FormData.fromMap({
      'city': city,
      'sub_city': subcity,
      'description': descritpion,
      'units_available': unitsAavilabel,
      'neighborhood_or_street_name': neighborhoodOrStreetName,
      'building_floors': buildingFloors,
      'price_per_sq': pricePerSqfeet,
      'number_of_bedrooms': numberOfBedRooms,
      'status': status,
      'real_state_company_name': realestateName,
      'realestate_image': multipartFiles
    });
    final response = await dio.post(url.toString(), data: formData);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return false;
    }
  }
}
