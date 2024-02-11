//  new page only to add new item  and delete on the item list its self no update for simplicfication

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../services/service_api_data_fetcher.dart';

class BrouchersDetailPage extends StatefulWidget {
  const BrouchersDetailPage({super.key});

  @override
  State<BrouchersDetailPage> createState() => _BrouchersDetailPageState();
}

class _BrouchersDetailPageState extends State<BrouchersDetailPage> {
  String CurrentSelectedChoice = "other";
  //  create a variable to hold image file path from file picker
  File? _imageFile;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  ApiFetcherService apiService = ApiFetcherService();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add Broucher"),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  icon: Icon(Icons.abc_rounded),
                  iconColor: Color.fromARGB(255, 85, 42, 92),
                  labelText: "Title",
                  labelStyle: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),
              TextField(
                controller: _descriptionController,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  icon: Icon(Icons.abc_rounded),
                  iconColor: Color.fromARGB(255, 85, 42, 92),
                  labelText: "Description",
                  labelStyle: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
              ),

              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Type",
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      width: 180,
                      child: DropdownButton<String>(
                        elevation: 10,
                        isExpanded: true,
                        iconEnabledColor: Colors.deepPurple,
                        iconSize: 30,
                        icon: const Icon(Icons.menu_book),
                        value:
                            CurrentSelectedChoice, // use the variable as the value
                        onChanged: (String? newValue) {
                          setState(() {
                            CurrentSelectedChoice = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            enabled: true,
                            alignment: Alignment.center,
                            value: 'main',
                            child: Text(
                              'Main',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'quickSand',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DropdownMenuItem(
                            alignment: Alignment.center,
                            value: 'other',
                            child: Text(
                              'Other',
                              style: TextStyle(
                                  fontFamily: 'quickSand',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //  save button to the bottom of the page
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 15),
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 150,
                  child: ElevatedButton.icon(
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
                    icon: const Icon(Icons.upload_file),
                    label: const Text("Upload"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 250,
                  height: 30,
                  margin: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () async {
                      //  save the data
                      //  check if an image is null  show toast messsage that its required to have an image
                      if (_imageFile == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              // rounded corner for snack bar
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.purple, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.grey[50],
                              elevation: 10,
                              content: const Text(
                                "Image is required",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        );
                        return;
                      }
                      //  collect all the data and send it to the api
                      bool response =
                          await apiService.addBrouchersAndBestOfferes(
                        _titleController.text,
                        _descriptionController.text,
                        CurrentSelectedChoice,
                        _imageFile!.path,
                      );
                      String responseMessage = "";
                      //  show a toast message that the data is saved
                      if (response) {
                        responseMessage =
                            "Brocuhers Information save successfully";
                      } else {
                        responseMessage =
                            "Data is not saved, please try again later";
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            // rounded corner for snack bar
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.purple, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.grey[50],
                            elevation: 10,
                            content: Text(
                              responseMessage,
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Save"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addBrouchersAndBestOfferes(
      String title, String description, String imagePath) {
    // Implement your API service logic here
    // Use the provided title, description, and imagePath variables
    // to pass the data to the API service
  }
}
