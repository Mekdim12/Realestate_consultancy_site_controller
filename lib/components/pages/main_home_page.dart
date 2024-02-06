import 'package:flutter/material.dart';
import '../small_components/card.dart';
import '../../services/service_api_data_fetcher.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    ApiFetcherService apiFetcherService = ApiFetcherService();
    var  data;
    apiFetcherService.fetchLandingPageStatusData().then((value) => 
    data = value
    );


    
    return Scaffold(
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
                  "ETB ${data.total_sales} 🤩",
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
                    CardWidget(150, 100, "Avg Price", "5984"),
                    CardWidget(150, 100, "Companies", "56"),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 25),
                child: CardWidget(
                  300,
                  100,
                  "New Call Request",
                  "6",
                ))
          ],
        )),
      ),
    );
  }
}
