import 'package:flutter/material.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  bool isPropertiesRealesate = true;
  String CurrentSelectedChoice = '1';
  String selectedSubCity = 'Bole';
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
              print(isPropertiesRealesate);
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
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: isPropertiesRealesate
                ? Column(
                    //  city
                    // sub-city
                    // description
                    // units available
                    // neigbourhood or street name
                    // building_floor
                    // price_sq
                    // number of bed rooms
                    // status
                    // real estate name
                    children: [
                      Row(
                        children: [
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
                            child: const TextField(
                              // controller: _passwordOfAdmin,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                                // icon: Icon(Icons.abc),
                                // iconColor: Color.fromARGB(255, 85, 42, 92),
                                // labelText: "City",
                                // labelStyle: TextStyle(
                                //   color: Colors.purple,
                                // ),
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
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                              ),
                              cursorColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                     
                    ],
                  )
                : Text('Vehicle')),
      ]),
    );
  }
}
