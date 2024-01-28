//  new page only to add new item  and delete on the item list its self no update for simplicfication

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BrouchersDetailPage extends StatefulWidget {
  const BrouchersDetailPage({super.key});

  @override
  State<BrouchersDetailPage> createState() => _BrouchersDetailPageState();
}

class _BrouchersDetailPageState extends State<BrouchersDetailPage> {
  String CurrentSelectedChoice = "other";
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
        width: double.infinity,
        height: screenHeight,
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            const TextField(
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                icon: Icon(Icons.abc_rounded),
                iconColor: Color.fromARGB(255, 85, 42, 92),
                labelText: "Tittle",
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
            ),
            const TextField(
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
                  onPressed: () async{
                    //  filepciker
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.image,
                      allowMultiple: false,
                      dialogTitle: "Select Brocuhers Image",
                    );
                    if (result != null) {
                      final path = result.files.single.path!;
                      final fileObject = File(path);
                      print(fileObject);
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
                  onPressed: () {},
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
    );
  }
}
