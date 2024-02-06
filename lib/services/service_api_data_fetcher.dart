
// import json and http package
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiFetcherService{
  Future fetchLandingPageStatusData() async {
    Uri url = Uri.parse('http://127.0.0.1:8000/api');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }
  }

