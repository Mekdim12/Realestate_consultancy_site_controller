//  new page only to add new item  and delete on the item list its self no update for simplicfication

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BrouchersDetailPage extends StatefulWidget {
  const BrouchersDetailPage({super.key});

  @override
  State<BrouchersDetailPage> createState() => _BrouchersDetailPageState();
}

class _BrouchersDetailPageState extends State<BrouchersDetailPage> {
  String CurrentSelectedChoice = "other";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add Broucher"),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
              margin: EdgeInsets.symmetric(vertical: 20),
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
                margin:
                    EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 15),
                child: DropdownButton(
                  elevation: 10,
                  isExpanded: true,
                  iconEnabledColor: Colors.green,
                  iconSize: 30,
                  icon: const Icon(Icons.menu_book),
                  value: "other",
                  onChanged: (value) {
                    setState(() {
                      CurrentSelectedChoice = value!;
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
                ))
          ],
        ),
      ),
    );
  }
}
