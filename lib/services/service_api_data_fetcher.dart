// import json and http package
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/brouchersAndSpecialOffer.dart';
import 'package:flutter/material.dart';
import '../models/properties.dart';
import '../models/contactsMe.dart';
import '../models/clientCallRequest.dart';

class ApiFetcherService {
  Future fetchContactInformation() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/contact-information/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        
        List contactMeInfo = data['contact_me_info'];
        List clientContactInfo = data['client_contact_info'];

        clientContactInfo = ContactMeMessage.fromJsonList(clientContactInfo);
        contactMeInfo = CallRequestedClient.fromJsonList(contactMeInfo);
        return [clientContactInfo, contactMeInfo];
        
      } catch (e) {
        print('Error decoding JSON: $e');
        print('Response body: ${response.body}');
      }
    }
    return [];
  }

  Future fetchLandingPageStatusData() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/home');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }

  Future fetchProfileStatusData() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/profile');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }

  Future updateProfileStatusData(
      String totalSales, String averageSoldPrice, String companies) async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/profile');
    final response = await http.post(url, body: {
      'total_sales': totalSales,
      'average_sold_price': averageSoldPrice,
      'companies': companies
    });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }

  Future addBrouchersAndBestOfferes(String nameOfTheFile, String description,
      String type, String filePath) async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/broucher');
    // use multipart to send file and text data

    var request = http.MultipartRequest('POST', url)
      ..fields['title'] = nameOfTheFile
      ..fields['description'] = description
      ..fields['type'] = type
      ..files.add(await http.MultipartFile.fromPath('image', filePath));
    var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future fetchBrouchersAndBestOfferes() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/broucher');
    final response = await http.get(url);

    if (response.body.isEmpty) {
      return [];
    }

    final parsed = jsonDecode(response.body);

    return BrouchersData.fromJsonList(parsed);
  }

  Future deleteBrocuherAndBestofferitem(String id) async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/broucher');
    await http.delete(url, body: {'id': id});
  }

  Future fetchContactMe() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api/contact');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }

  Future fetchProperties() async {
    try {
      Uri urlRealEstate =
          Uri.parse('http://127.0.0.1:8000/api/property/realestate');
      Uri urlVehicles = Uri.parse('http://127.0.0.1:8000/api/property/vehicle');

      // Perform requests concurrently
      final responses = await Future.wait([
        http.get(urlRealEstate),
        http.get(urlVehicles),
      ]);

      final finalResponse = [];

      for (var response in responses) {
        if (response.statusCode == 200) {
          try {
            final responseBody = jsonDecode(response.body);
            if (response.request?.url == urlRealEstate) {
              finalResponse
                  .add(PropertyRealstateData.fromJsonList(responseBody));
            } else if (response.request?.url == urlVehicles) {
              finalResponse
                  .add(PropertyVehiclesData.fromJsonList(responseBody));
            }
          } catch (e) {
            print('Error decoding JSON: $e');
            print('Response body: ${response.body}');
          }
        } else {
          print('Request failed with status: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      }
      return finalResponse;
    } catch (e) {
      return [];
    }
  }
}
