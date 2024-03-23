import 'package:flutter/material.dart';
import './properties_pages.dart';
import '../../services/service_api_data_fetcher.dart';
import '../../models/brouchersAndSpecialOffer.dart';

import '../../models/properties.dart';


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
        future:apiService.fetchProperties(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Show loading while waiting for data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Show error ifc any
          } else {
            print( snapshot.data);
            print("-------------------------------------------->");
            // listOfBroucherItems = snapshot.data;
            listOfPropertiesItems = snapshot.data;
            print(listOfPropertiesItems);
            // return Scaffold(
            //   body: Center(child: Text('No Properties Found')),
            // );
            bool is_image_available = listOfPropertiesItems.length > 0;
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PropertiesPage()),
                  );
                },
                backgroundColor: Colors.purple,
                child: const Icon(Icons.add),
              ),
              body: is_image_available
                  ? Column(children: [
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        height: screenHeight - 400,
                        child: ListView.builder(
                            itemCount: listOfBroucherItems.length,
                            itemBuilder: (context, index) {
                              var currentItem = listOfBroucherItems[index];
                              return ListTile(
                                onTap: () => {},
                                iconColor: Colors.purple,
                                selectedColor: Colors.deepPurple,
                                enableFeedback: true,
                                hoverColor: Color.fromARGB(89, 104, 58, 183),
                                contentPadding: const EdgeInsets.all(5),
                                leading: Image(
                                    image: NetworkImage(currentItem.filePath)),
                                title: Text(
                                  currentItem.nameOfTheFile,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.purple),
                                ),
                                subtitle: (currentItem.description
                                            .toString()
                                            .length >
                                        50)
                                    ? Text(
                                        "${currentItem.description.toString().substring(0, 50)}...")
                                    : Text(
                                        "${currentItem.description.toString().substring(0, currentItem.description.toString().length)}..."),
                                trailing: ElevatedButton.icon(
                                  onPressed: () {
                                    apiService.deleteBrocuherAndBestofferitem(
                                        currentItem.id.toString());
                                    setState(() {
                                      listOfBroucherItems.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                  label: const Text(''),
                                ),
                              );
                            }),
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