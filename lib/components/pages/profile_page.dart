import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../services/service_api_data_fetcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ApiFetcherService apiFetcherService = ApiFetcherService();
  TextEditingController _totalSalesController = TextEditingController();
  TextEditingController _averageSoldPriceController = TextEditingController();
  TextEditingController _companiesWorkingController = TextEditingController();

  @override
  void dispose() {
    _totalSalesController.dispose();
    _averageSoldPriceController.dispose();
    _companiesWorkingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: apiFetcherService.fetchProfileStatusData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading while waiting for data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Show error if any
          } else {
            if (snapshot.data.isEmpty) {
              _totalSalesController.text = '0';
              _averageSoldPriceController.text = '0';
              _companiesWorkingController.text = '0';
            } else {
              _totalSalesController.text = snapshot.data['total_sales'].toString();
              _averageSoldPriceController.text = snapshot.data['average_sold_price'].toString();
              _companiesWorkingController.text = snapshot.data['companies'].toString();
            }

            return Container(
              height: MediaQuery.of(context).size.height - 100,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 15),
                      child: const Text(
                        "STATUS",
                        style: TextStyle(
                            color: Color.fromARGB(159, 72, 59, 6),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 5),
                      child: Row(
                        children: [
                          const Text(
                            "🤝",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF483b06)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            width: screenWidth * 0.8,
                            child: TextField(
                              controller: _totalSalesController,
                              style: TextStyle(
                                  color:  Color.fromARGB(159, 72, 59, 6),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                                labelText: "Total Sales",
                                labelStyle: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 25),
                      child: Row(
                        children: [
                          const Text(
                            "💰",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF483b06)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            width: screenWidth * 0.8,
                            child: TextField(
                              controller: _averageSoldPriceController,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                                labelText: "Average Sold Price",
                                labelStyle: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 25),
                      child: Row(
                        children: [
                          const Text(
                            "🏛️",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF483b06)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            width: screenWidth * 0.8,
                            child: TextField(
                              controller: _companiesWorkingController,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 17, 15, 15),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                                labelText: "Companies Working with you",
                                labelStyle: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: 200,
                        height: 40,
                        margin: const EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                            style: const ButtonStyle(
                             
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.deepPurple),
                              elevation: MaterialStatePropertyAll(15),
                            ),
                            onPressed: () {
                              apiFetcherService.updateProfileStatusData(
                                  _totalSalesController.text,
                                  _averageSoldPriceController.text,
                                  _companiesWorkingController.text);
                            },
                            child: const Text("Update", style: TextStyle(color: Colors.white))),)
                  ],
                ),
              ),
            );
          }
        });
  }
}
