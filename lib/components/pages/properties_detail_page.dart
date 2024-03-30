import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../../models/properties.dart';

class PropertiesDetailPage extends StatefulWidget {
  final propertyObject;

  const PropertiesDetailPage(this.propertyObject, {super.key});

  @override
  State<PropertiesDetailPage> createState() => _PropertiesDetailPageState();
}

class _PropertiesDetailPageState extends State<PropertiesDetailPage> {
  int selectedImageIndex = 0;
  List listOfImages = [];
  File? _imageFile;
  String statusOfVehicle = "NEW";
  String selectedSubCity = 'Bole';
  TextEditingController _descriptionController = TextEditingController();
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
  Widget viewBuilder(dynamic propertyObject) {
    final Widget returnWidget;

    if (propertyObject is PropertyVehiclesData) {
      listOfImages = propertyObject.vehicleImage;
      setState(() {
        listOfImages;
        propertyObject = propertyObject;
      });
      returnWidget = Scaffold(
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
          height: MediaQuery.of(context).size.height - 100,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        //   delete the image by sending delete the request here have it in state first
                        setState(() {
                          selectedImageIndex = index;
                        });
                      },
                      height: 200,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8),
                  itemCount: listOfImages.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(listOfImages[itemIndex]),
                            fit: BoxFit.fitWidth),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          print("Pressed SItem ${selectedImageIndex}");
                        },
                        icon: const Icon(Icons.delete_forever,
                            color: Colors.white),
                        label: const Text("Delete"),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(113, 155, 39, 176)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          //  filepciker
                          final result = await FilePicker.platform.pickFiles(
                            type: FileType.image,
                            allowMultiple: false,
                            dialogTitle: "Select Brocuhers Image",
                          );
                          if (result != null) {
                            final path = result.files.single.path!;
                            final fileObject = File(path);
                            _imageFile = fileObject;
                          }
                        },
                        icon:
                            const Icon(Icons.upload_file, color: Colors.white),
                        label: const Text("Upload"),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(113, 155, 39, 176)),
                        ),
                      ),
                    ],
                  )),
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
                    child: const TextField(
                      // controller: _passwordOfAdmin,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    child: const TextField(
                      // controller: _passwordOfAdmin,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    child: const TextField(
                      // controller: _passwordOfAdmin,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    child: const TextField(
                      // controller: _passwordOfAdmin,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    child: const TextField(
                      // controller: _passwordOfAdmin,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      value: statusOfVehicle,
                      elevation: 10,
                      isExpanded: true,
                      iconEnabledColor: Color.fromARGB(114, 104, 58, 183),
                      hint: Text('Condition'),
                      items: ["NEW", "USED", "SLIGHTLY USED"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          // statusOfVehicle = newValue!;
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
                      "Plate Number City",
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        value: plateNumberLabeledCity,
                        elevation: 10,
                        isExpanded: true,
                        iconEnabledColor: Color.fromARGB(114, 104, 58, 183),
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
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // map the list of the country to thier abbr for storing
                          setState(() {
                            // plateNumberLabeledCity = newValue!;
                          });
                        },
                      ))
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
              ),
              //  update Button
              Center(
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload),
                    label: const Text("Update")),
              )
            ],
          )),
        ),
      );
    } else {
      listOfImages = propertyObject.propertyImage;
      setState(() {
        listOfImages;
        propertyObject = propertyObject;
      });

      returnWidget = Scaffold(
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
          height: MediaQuery.of(context).size.height - 100,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        //   delete the image by sending delete the request here have it in state first
                        setState(() {
                          selectedImageIndex = index;
                        });
                      },
                      height: 200,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8),
                  itemCount: listOfImages.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(listOfImages[itemIndex]),
                            fit: BoxFit.fitWidth),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        print("Pressed SItem ${selectedImageIndex}");
                      },
                      icon:
                          const Icon(Icons.delete_forever, color: Colors.white),
                      label: const Text("Delete"),
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(113, 155, 39, 176)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        //  filepciker
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.image,
                          allowMultiple: false,
                          dialogTitle: "Select Properties Image",
                        );
                        if (result != null) {
                          final path = result.files.single.path!;
                          final fileObject = File(path);
                          _imageFile = fileObject;
                        }
                      },
                      icon: const Icon(Icons.upload_file, color: Colors.white),
                      label: const Text("Upload"),
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(113, 155, 39, 176)),
                      ),
                    ),
                  ],
                ),
              ),
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
                    width: MediaQuery.of(context).size.width - 200,
                    child: const TextField(
                      // controller: _passwordOfAdmin,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    width: MediaQuery.of(context).size.width - 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      value: selectedSubCity,
                      elevation: 10,
                      isExpanded: true,
                      iconEnabledColor: Color.fromARGB(114, 104, 58, 183),
                      hint: Text('Sub City'),
                      items: listOfSubCity
                          .map<DropdownMenuItem<String>>((String value) {
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
                    width: MediaQuery.of(context).size.width - 200,
                    child: const TextField(
                      // controller: _passwordOfAdmin,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    width: MediaQuery.of(context).size.width - 200,
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      // controller: _passwordOfAdmin,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    width: MediaQuery.of(context).size.width - 200,
                    child: const TextField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    width: MediaQuery.of(context).size.width - 200,
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    width: MediaQuery.of(context).size.width - 200,
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
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
                    width: MediaQuery.of(context).size.width - 200,
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ],
              ),
               Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
              ),
              Center(
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload),
                    label: const Text("Update")),
              )
            ],
          )),
        ),
      );
    }
    return returnWidget;
  }

  @override
  Widget build(BuildContext context) {
    final propertyObject = widget.propertyObject;

    return viewBuilder(propertyObject);
  }
}
