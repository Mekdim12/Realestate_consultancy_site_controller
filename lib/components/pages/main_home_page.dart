import 'package:flutter/material.dart';
import '../small_components/card.dart';
import '../../services/service_api_data_fetcher.dart';
import 'package:intl/intl.dart';
class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
   ApiFetcherService apiFetcherService = ApiFetcherService();
   
  @override
  Widget build(BuildContext context) {
    

  return FutureBuilder(
    future: apiFetcherService.fetchLandingPageStatusData(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator()); // Show loading while waiting for data
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}'); // Show error if any
      } else {
        
         if (snapshot.data.isEmpty) {
            snapshot.data['total_sales'] = 0;
            snapshot.data['average_sold_price'] = 0;
            snapshot.data['companies'] = 0;
            snapshot.data['call_request'] = 0;
          }   
          final formatter = NumberFormat('#,###');
          String formattedTotalSales = formatter.format(int.parse(snapshot.data['total_sales'].toString()));   
          String formatterForAvgPrice = formatter.format(int.parse(snapshot.data['average_sold_price'].toString()));  
        return  Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child:  Center(
                child: Text(
                  "ETB $formattedTotalSales 🤩",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardWidget(150, 100, "Avg Price", "\$ $formatterForAvgPrice"),
                    CardWidget(150, 100, "Companies", snapshot.data['companies'].toString()),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 25),
                child: CardWidget(
                  300,
                  100,
                  "New Call Request",
                snapshot.data['call_request'].toString(),
                ))
          ],
        )),
      ),
    );
 
      }
    });
    

    
 }
}
