
// import json and http package
import 'dart:convert';
import 'package:http/http.dart' as http;

// use local host 8000 for testing and fetch data using the json format


class ApiFetcherService{
  Future fetchLandingPageStatusData() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return [];
    }
    return [];
  }
  }

