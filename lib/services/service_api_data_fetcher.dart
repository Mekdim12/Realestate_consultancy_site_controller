
// import json and http package
import 'dart:convert';
import 'package:http/http.dart' as http;

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
}

