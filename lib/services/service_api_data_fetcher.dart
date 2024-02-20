
// import json and http package
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/brouchersAndSpecialOffer.dart';
import 'package:flutter/material.dart';

class ApiFetcherService{
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
  Future updateProfileStatusData(String totalSales, String averageSoldPrice, String companies) async {
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



    Future addBrouchersAndBestOfferes(String nameOfTheFile, String description, String type, String filePath) async {
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
       
        if(response.body.isEmpty){
          return [];
        }

        final parsed = jsonDecode(response.body);
      
        return BrouchersData.fromJsonList(parsed);
        
      }

      Future deleteBrocuherAndBestofferitem(String id) async{
         Uri url = Uri.parse('http://127.0.0.1:8000/api/broucher');
          await http.delete(url, body: {
            'id': id
          });
      }


      Future fetchContactMe() async{
        Uri url = Uri.parse('http://127.0.0.1:8000/api/contact');
        final response = await http.get(url);
        if (response.statusCode == 200) {
          return json.decode(response.body);
        }
        return [];
      }

}
