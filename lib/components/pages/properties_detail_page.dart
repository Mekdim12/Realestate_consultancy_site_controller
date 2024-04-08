import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../../models/properties.dart';
import '../../services/service_api_data_add_and_updater.dart';

typedef OnUpdateCallback = Function(dynamic updatedObject);

class PropertiesDetailPage extends StatefulWidget {
  final OnUpdateCallback onUpdate;
  final propertyObject;
  const PropertiesDetailPage(this.propertyObject,
      {Key? key, required this.onUpdate})
      : super(key: key);

  @override
  State<PropertiesDetailPage> createState() => _PropertiesDetailPageState();
}

class _PropertiesDetailPageState extends State<PropertiesDetailPage> {
  ApiDataUploaderAndUpdater apiService = ApiDataUploaderAndUpdater();
  List listOfImages = [];
  String selectedStAtusOfSales = 'Available';
  List<String> statusOfSale = [
    "Sold Out",
    "Available",
  ];
  String statusOfVehicle = "NEW";
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

  bool onHoveraddMoreBtn = false;
  String plateNumberLabeledCity = "Addis Ababa";
  int selectedImageIndex = 0;
  String selectedSubCity = 'Bole';
  String id = "";
  dynamic _propertyObject;

  // TextEditingController _descriptionController = TextEditingController();
  File? _imageFile;
  List newUplodedImages = [];

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

 

  void saveChanges() {
    if (widget.onUpdate != null) {
      widget.onUpdate!(_propertyObject);
    }
  }

  //  override the init method to set the value of the text field
  @override
  void initState() {
    super.initState();
    final propertyObject = widget.propertyObject;

    setState(() {
      propertyObject;
      _propertyObject = propertyObject;
    });

    if (propertyObject is PropertyVehiclesData) {
      _priceVehicle.text = propertyObject.price;
      _brandName.text = propertyObject.nameOfTheCar;
      _colorVehicle.text = propertyObject.color;
      _descriptionVehicle.text = propertyObject.description;
      _unitsAvailabel.text = propertyObject.unitsAvailabel;
      statusOfVehicle = propertyObject.userOrNew;

      listOfImages = propertyObject.vehicleImage;
      setState(() {
        id = propertyObject.id;
        statusOfVehicle;
        listOfImages;
      });
    } else if (propertyObject is PropertyRealstateData) {
      selectedStAtusOfSales =
          propertyObject.status.toString().toLowerCase().trim();
      if (selectedStAtusOfSales == "active") {
        selectedStAtusOfSales = "Available";
      } else {
        selectedStAtusOfSales = "Sold Out";
      }

      listOfImages = propertyObject.propertyImage;
      _realestateCity.text = propertyObject.city;
      _realestateDescription.text = propertyObject.description;
      _realestateUnitsAvailabell.text = propertyObject.unitsAvailabel;
      _realestatestName.text = propertyObject.neighborhoodOrStreetName;
      _realestateBuildingNumber.text = propertyObject.buildingFloors;
      _realestatePrice.text = propertyObject.pricePerSq;
      _realestateNumberOfBedRooms.text = propertyObject.numberOfBedrooms;
      _realestaterealEstateName.text = propertyObject.realstateCompanyName;
      selectedSubCity = propertyObject.subCity;

      setState(() {
        id = propertyObject.id;
        selectedStAtusOfSales;
        selectedSubCity;
        listOfImages;
      });
    }
  }

  Widget viewBuilder(dynamic propertyObject) {
    final Widget returnWidget;

    if (propertyObject is PropertyVehiclesData) {
      returnWidget = Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Property Detail"),
          ),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                // delete the data
                bool response = await apiService.deleteProperty(id, "vehicle");
                if (response == true) {
                  saveChanges();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                        const SnackBar(
                            content: Text("Vehicle Information Deleted")),
                      )
                      .closed
                      .then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Vehicle Information not Deleted")));
                }
              },
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
                    var imageProvider;
                    var item = (listOfImages as List<dynamic>)[itemIndex];
                    if (item is File) {
                      imageProvider = FileImage(item);
                    } else if (item is String) {
                      imageProvider = NetworkImage(item);
                    }
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fitWidth,
                        ),
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
                        onHover: (is_hovering) {
                          setState(() {
                            onHoveraddMoreBtn = is_hovering;
                          });
                        },
                        onFocusChange: (evt) {
                          setState(() {
                            onHoveraddMoreBtn = false;
                          });
                        },
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
                            listOfImages.add(fileObject);
                            newUplodedImages?.add(path);

                            setState(() {
                              listOfImages;
                            });
                          }
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                        label: const Text("Add Picture"),
                        style: onHoveraddMoreBtn
                            ? const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green),
                              )
                            : const ButtonStyle(
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
                    child: TextField(
                      controller: _brandName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _colorVehicle,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _descriptionVehicle,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _unitsAvailabel,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _priceVehicle,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                          statusOfVehicle = newValue!;
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
                          if (value == propertyObject.plateNumberCity) {
                            plateNumberLabeledCity = value;
                          }
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
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
              ),
              Row(children: [
                const SizedBox(
                  width: 100,
                  child: Text(
                    "Sales Status",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width - 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      value: selectedStAtusOfSales,
                      elevation: 10,
                      isExpanded: true,
                      iconEnabledColor: Color.fromARGB(114, 104, 58, 183),
                      hint: Text('Sales status'),
                      items: statusOfSale
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStAtusOfSales = newValue!;
                        });
                      },
                    ))
              ]),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
              ),

              Center(
                child: ElevatedButton.icon(
                    onPressed: () async {
                      // update the data
                      String resultStatus = "";
                      if (selectedStAtusOfSales == "Available") {
                        resultStatus = "Active";
                      } else {
                        resultStatus = "In active";
                      }

                      List response_ = await apiService.updateVehicleProperty(
                        _brandName.text,
                        _colorVehicle.text,
                        plateNumberLabeledCity,
                        _descriptionVehicle.text,
                        _unitsAvailabel.text,
                        _priceVehicle.text,
                        statusOfVehicle,
                        resultStatus,
                        newUplodedImages,
                        id,
                      );

                      if (response_[0] == true) {
                        // show snackbar
                        propertyObject = response_[1];
                        setState(() {
                          propertyObject;
                        });
                        saveChanges();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Vehicle Information Updated")));
                      } else {
                        // show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Vehicle Information not Updated")));
                      }
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text("Update")),
              ),

              //  update Button
            ],
          )),
        ),
      );
    } else if (propertyObject is PropertyRealstateData) {
      returnWidget = Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Property Detail"),
          ),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                // delete the data
                bool response =
                    await apiService.deleteProperty(id, "realstate");
                if (response == true) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Real-estate Information Deleted")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Real-estate Information not Deleted")));
                }
                // after showing snackbar back to the previous page
                Navigator.pop(context);
              },
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
                    var imageProvider;
                    var item = (listOfImages as List<dynamic>)[itemIndex];
                    if (item is File) {
                      imageProvider = FileImage(item);
                    } else if (item is String) {
                      imageProvider = NetworkImage(item);
                    }
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fitWidth,
                        ),
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
                      onHover: (is_hovering) {
                        setState(() {
                          onHoveraddMoreBtn = is_hovering;
                        });
                      },
                      onFocusChange: (evt) {
                        setState(() {
                          onHoveraddMoreBtn = false;
                        });
                      },
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
                          listOfImages.add(fileObject);
                          newUplodedImages?.add(path);

                          setState(() {
                            listOfImages;
                          });
                        }
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text("add Picture"),
                      style: onHoveraddMoreBtn
                          ? const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green),
                            )
                          : const ButtonStyle(
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
                    child: TextField(
                      controller: _realestateCity,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _realestateDescription,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _realestateUnitsAvailabell,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _realestatestName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _realestateBuildingNumber,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _realestatePrice,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _realestateNumberOfBedRooms,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    child: TextField(
                      controller: _realestaterealEstateName,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      decoration: const InputDecoration(
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
                    "Sales Status",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width - 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      value: selectedStAtusOfSales,
                      elevation: 10,
                      isExpanded: true,
                      iconEnabledColor: Color.fromARGB(114, 104, 58, 183),
                      hint: Text('Sales status'),
                      items: statusOfSale
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStAtusOfSales = newValue!;
                        });
                      },
                    ))
              ]),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
              ),
              Center(
                child: ElevatedButton.icon(
                    onPressed: () async {
                      // update the data
                      String resultStatus = "";
                      if (selectedStAtusOfSales == "Available") {
                        resultStatus = "Active";
                      } else {
                        resultStatus = "In active";
                      }

                      List response_ =
                          await apiService.updateRealestateProperty(
                              _realestateCity.text,
                              selectedSubCity,
                              _realestateDescription.text,
                              _realestateUnitsAvailabell.text,
                              _realestatestName.text,
                              _realestateBuildingNumber.text,
                              _realestatePrice.text,
                              _realestateNumberOfBedRooms.text,
                              resultStatus,
                              _realestaterealEstateName.text,
                              newUplodedImages,
                              id);
                      if (response_[0] == true) {
                        // show snackbar
                        propertyObject = response_[1];
                        setState(() {
                          propertyObject;
                        });
                        saveChanges();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Real-estate Information Updated")));
                      } else {
                        // show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Real-estate Information not Updated")));
                      }
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text("Update")),
              )
            ],
          )),
        ),
      );
    } else {
      returnWidget = const Center(child: Text("No data found"));
    }
    return returnWidget;
  }

  @override
  Widget build(BuildContext context) {
    final propertyObject = widget.propertyObject;

    return viewBuilder(propertyObject);
  }
}
