import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../services/service_api_data_add_and_updater.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  bool isPropertiesRealesate = true;
  String statusOfVehicle = "NEW";
  String CurrentSelectedChoice = '1';
  String selectedSubCity = 'Bole';
  List<File> files = [];
  ApiDataUploaderAndUpdater apiDataUploaderAndUpdater = ApiDataUploaderAndUpdater();

  String plateNumberLabeledCity = "Addis Ababa";
  List<String> listOfSubCity = [
    "Akaky Kaliti",
    "Arada",
    "Bole",
    "Gullele",
    "Kirkos",
    "Kolfe Keranio",
    "Addis Ketema",
    "Lideta",
    "Nifas Silk-Lafto",
    "Yeka"
  ];

  final _priceVehicle = TextEditingController();
  final _brandName = TextEditingController();
  final _colorVehicle = TextEditingController();
  final _descriptionVehicle = TextEditingController();
  final _unitsAvailabel = TextEditingController();
  
  final _realestateCity = TextEditingController();
  final _realestateDescription = TextEditingController();
  final _realestateUnitsAvailabell = TextEditingController();
  final _realestatestName = TextEditingController();
  final _realestateBuildingNumber = TextEditingController();
  final _realestatePrice = TextEditingController();
  final _realestateNumberOfBedRooms = TextEditingController();
  final _realestaterealEstateName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Property Detail"),
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
            ),
            label: Text(""),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.purple)),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(children: [
          Container(
            width: 250,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<String>(
              elevation: 10,
              isExpanded: true,
              iconEnabledColor: Colors.deepPurple,
              iconSize: 30,
              icon: const Icon(Icons.menu_book),
              value: CurrentSelectedChoice, // use the variable as the value
              onChanged: (String? newValue) {
                setState(() {
                  CurrentSelectedChoice = newValue!;

                  if (CurrentSelectedChoice == '1') {
                    isPropertiesRealesate = true;
                  } else {
                    isPropertiesRealesate = false;
                  }
                });
              },
              items: const [
                DropdownMenuItem(
                  // enabled: true,
                  alignment: Alignment.center,
                  value: '1',
                  child: Text(
                    'Real Estate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'quickSand', fontWeight: FontWeight.w600),
                  ),
                ),
                DropdownMenuItem(
                  alignment: Alignment.center,
                  value: '2',
                  child: Text(
                    'Vehicle',
                    style: TextStyle(
                        fontFamily: 'quickSand', fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: isPropertiesRealesate
                  ? Container(
                      height: MediaQuery.of(context).size.height - 150,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "City",
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child:  TextField(
                                    controller: _realestateCity,
                                    style:const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            Row(children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Sub City",
                                  style: TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: DropdownButton<String>(
                                    value: selectedSubCity,
                                    elevation: 10,
                                    isExpanded: true,
                                    iconEnabledColor:
                                        Color.fromARGB(114, 104, 58, 183),
                                    hint: Text('Sub City'),
                                    items: listOfSubCity
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedSubCity = newValue!;
                                      });
                                    },
                                  ))
                            ]),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Description",
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child:  TextField(
                                    controller: _realestateDescription,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                    decoration:const  InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Units Available",
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _realestateUnitsAvailabell,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "St name",
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child:  TextField(
                                    controller: _realestatestName,
                                    style: const TextStyle(
                                      
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Building Number",
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child:  TextField(
                                    controller: _realestateBuildingNumber,
                                    keyboardType: TextInputType.number,
                                    style:const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Price",
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child:  TextField(
                                    controller: _realestatePrice,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                    decoration:const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Number of Bed Rooms",
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child:  TextField(
                                    controller: _realestateNumberOfBedRooms,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Real Estate Name",
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child:  TextField(
                                    controller: _realestaterealEstateName,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                    cursorColor: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            //  submit button
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 30),
                            ),
                            //  image picker
                          ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                allowMultiple: true,
                                type: FileType.custom,
                                allowedExtensions: ['jpg', 'png', 'jpeg'],
                              );

                              if (result != null) {
                                files = result.paths.map((path) => File(path!)).toList();
                                setState(() {
                                  files = files;
                                });
                                // Now you can use your list of files
                              }
                            },
                            child: const Text('Pick images'),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                          ),

                          (files.isNotEmpty)? 
                           // Only show the grid view if there are images
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 200, // Set a specific height for the grid view
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Adjust number based on your needs
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: files.length,
                              itemBuilder: (context, index) {
                                return Image.file(files[index]);
                              },
                            ),
                          ):
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            child: const Text('No images selected'),
                          ),
                        
                          Container(
                            width: MediaQuery.of(context).size.width - 200,
                            child: ElevatedButton(
                              onPressed: () {
                                if(files.length == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please select at least 3 images images for the properties'),
                                    ),
                                  );
                                }
                                // final response = apiDataUploaderAndUpdater.addPropertyVehiclesData(
                                //   _brandName.text,
                                //   _colorVehicle.text,
                                //   plateNumberLabeledCity,
                                //   _descriptionVehicle.text,
                                //   _unitsAvailabel.text,
                                //   _priceVehicle.text,
                                //   statusOfVehicle,
                                //   "ACTIVE",
                                //   files
                                // );
                              
                              },
                              child: const Text('Submit'),
                            ),
                          )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height - 150,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Brand Name",
                                  style: TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child:  TextField(
                                  controller: _brandName,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purple)),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Color",
                                  style: TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child: TextField(
                                  controller: _colorVehicle,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purple)),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child:  TextField(
                                  controller: _descriptionVehicle,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purple)),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Unites avialbel",
                                  style: TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child:  TextField(
                                  controller: _unitsAvailabel,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purple)),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Price",
                                  style: TextStyle(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child:  TextField(
                                  controller: _priceVehicle,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purple)),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          Row(children: [
                            const SizedBox(
                              width: 100,
                              child: Text(
                                "Condition",
                                style: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 200,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: DropdownButton<String>(
                                  value: statusOfVehicle,
                                  elevation: 10,
                                  isExpanded: true,
                                  iconEnabledColor:
                                      Color.fromARGB(114, 104, 58, 183),
                                  hint: Text('Condition'),
                                  items: ["NEW", "USED", "SLIGHTLY USED"]
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      statusOfVehicle = newValue!;
                                    });
                                  },
                                ))
                          ]),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          Row(children: [
                            const SizedBox(
                              width: 100,
                              child: Text(
                                "Condition",
                                style: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 200,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: DropdownButton<String>(
                                  value: plateNumberLabeledCity,
                                  elevation: 10,
                                  isExpanded: true,
                                  iconEnabledColor:
                                      Color.fromARGB(114, 104, 58, 183),
                                  hint: const Text('Plate Number City'),
                                  items: [
                                    "Amhara",
                                    "Addis Ababa",
                                    "Eritrea",
                                    "Oromia",
                                    "Harar",
                                    "Tigray",
                                    "Somali",
                                    "Benishangul",
                                    "Gambela"
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    // map the list of the country to thier abbr for storing
                                    setState(() {
                                      plateNumberLabeledCity = newValue!;
                                    });
                                  },
                                ))
                          ]),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                          ),

                          //  image picker
                          ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                allowMultiple: true,
                                type: FileType.custom,
                                allowedExtensions: ['jpg', 'png', 'jpeg'],
                              );

                              if (result != null) {
                                files = result.paths.map((path) => File(path!)).toList();
                                setState(() {
                                  files = files;
                                });
                                // Now you can use your list of files
                              }
                            },
                            child: const Text('Pick images'),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                          ),

                          (files.isNotEmpty)? 
                           // Only show the grid view if there are images
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 200, // Set a specific height for the grid view
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Adjust number based on your needs
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: files.length,
                              itemBuilder: (context, index) {
                                return Image.file(files[index]);
                              },
                            ),
                          ):
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            child: const Text('No images selected'),
                          ),
                        
                          Container(
                            width: MediaQuery.of(context).size.width - 200,
                            child: ElevatedButton(
                              onPressed: () {
                                if(files.length == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please select at least 3 images images for the properties'),
                                    ),
                                  );
                                }
                                final response = apiDataUploaderAndUpdater.addPropertyVehiclesData(
                                  _brandName.text,
                                  _colorVehicle.text,
                                  plateNumberLabeledCity,
                                  _descriptionVehicle.text,
                                  _unitsAvailabel.text,
                                  _priceVehicle.text,
                                  statusOfVehicle,
                                  "ACTIVE",
                                  files
                                );
                              
                              },
                              child: const Text('Submit'),
                            ),
                          )
                        ]),
                      ),
                    )),
        ]),
      ),
    );
  }
}
