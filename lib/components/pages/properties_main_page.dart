import 'package:flutter/material.dart';
import './properties_pages.dart';
import '../../services/service_api_data_fetcher.dart';
import '../../models/brouchersAndSpecialOffer.dart';

import '../../models/properties.dart';
import './properties_detail_page.dart';

class PropertiesMainPage extends StatefulWidget {
  const PropertiesMainPage({super.key});

  @override
  State<PropertiesMainPage> createState() => _PropertiesMainPageState();
}

class _PropertiesMainPageState extends State<PropertiesMainPage> {
  ApiFetcherService apiService = ApiFetcherService();
  List listOfPropertiesItems = [];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: apiService.fetchProperties(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Show loading while waiting for data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Show error ifc any
          } else {
            listOfPropertiesItems = snapshot.data;

            bool is_available = listOfPropertiesItems.length > 0;
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PropertiesPage()),
                  );
                },
                backgroundColor: Colors.purple,
                child: const Icon(Icons.add),
              ),
              body: is_available
                  ? Column(children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 20),
                        child: Center(
                            child: Text(
                          "🏡/🚗",
                          style: TextStyle(fontSize: 30),
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        height: screenHeight - 400,
                        child: ListView.builder(
                          itemCount: listOfPropertiesItems.length,
                          itemBuilder: (context, index) {
                            var currentItem = listOfPropertiesItems[index];
                            return CustomScrollView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              slivers: <Widget>[
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int subIndex) {
                                      var subItem = currentItem[subIndex];
                                      Widget currentTile;
                                      if (subItem is PropertyRealstateData) {
                                        // Handle PropertyRealstateData
                                        currentTile = Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(37, 0, 0,
                                                    0)), // Change this to your preferred border color
                                            borderRadius: BorderRadius.circular(
                                                10), // Change this to your preferred border radius
                                          ),
                                          child: ListTile(
                                            iconColor: Colors.purple,
                                            selectedColor: Colors.deepPurple,
                                            enableFeedback: true,
                                            hoverColor: Color.fromARGB(
                                                89, 104, 58, 183),
                                            contentPadding:
                                                const EdgeInsets.all(5),
                                            leading: Icon(Icons.home),
                                            title: Text(
                                                "${subItem.realstateCompanyName}"),
                                            subtitle: Text(
                                                "\$ ${subItem.pricePerSq}"),
                                          ),
                                        );
                                      } else if (subItem
                                          is PropertyVehiclesData) {
                                        // Handle PropertyVehiclesData
                                        currentTile = Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(37, 0, 0,
                                                    0)), // Change this to your preferred border color
                                            borderRadius: BorderRadius.circular(
                                                10), // Change this to your preferred border radius
                                          ),
                                          child: ListTile(
                                            iconColor: Colors.purple,
                                            selectedColor: Colors.deepPurple,
                                            enableFeedback: true,
                                            hoverColor: Color.fromARGB(
                                                89, 104, 58, 183),
                                            contentPadding:
                                                const EdgeInsets.all(5),
                                            leading:
                                                Icon(Icons.car_rental_rounded),
                                            title:
                                                Text("${subItem.nameOfTheCar}"),
                                            subtitle:
                                                Text("\$ ${subItem.price}"),
                                          ),
                                        );
                                      } else {
                                        // Handle other types
                                        currentTile = ListTile();
                                      }

                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PropertiesDetailPage(1, "")),
                                          );
                                        },
                                        child: currentTile,
                                        splashColor: Colors
                                            .purpleAccent, // Change this to your preferred splash color
                                      );
                                    },
                                    childCount: currentItem.length,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ])
                  : SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 105,
                              height: 105,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  // no item found sad search message
                                  image:
                                      AssetImage('assets/images/not_found.png'),
                                ),
                              )),
                          const Text(
                            "No Properties Found +",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
            );
          }
        });
  }
}
