import 'package:flutter/material.dart';

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
                ? Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: SingleChildScrollView(
                      child: Column(
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
                                width: MediaQuery.of(context).size.width - 200,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                width: MediaQuery.of(context).size.width - 200,
                                child: const TextField(
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
                                child: const TextField(
                                  keyboardType: TextInputType.number,
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
                                width: MediaQuery.of(context).size.width - 200,
                                child: const TextField(
                                  keyboardType: TextInputType.number,
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

                          //  submit button
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 30),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 200,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Submit'),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: SingleChildScrollView(
                      child: Column(

                          // name_of_the_car
                          // color
                          // plate_number_city
                          // description
                          // units_available
                          // price

                          // used_or_new
                          // status

                          children: [
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
                                  width:
                                      MediaQuery.of(context).size.width - 200,
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
                                  width:
                                      MediaQuery.of(context).size.width - 200,
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
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child: const TextField(
                                    // controller: _passwordOfAdmin,
                                    keyboardType: TextInputType.number,
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
                                  child: const TextField(
                                    // controller: _passwordOfAdmin,
                                    keyboardType: TextInputType.number,
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
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                            Container(
                              width: MediaQuery.of(context).size.width - 200,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Submit'),
                              ),
                            )
                          ]),
                    ),
                  )),
      ]),
    );
  }
}


/*

<select name="city_name2" class="form-control" id="">
                                        <option value="AA" selected="">Addis Ababa</option>
                                        <option value="AM">Amhara</option>
                                        <option value="ER">Eritrea</option>
                                        <option value="OR">Oromia</option>
                                        <option value="HA">Harar</option>
                                        <option value="TI">Tigray</option>
                                        <option value="SO">Somali</option>
                                        <option value="BE">Benishangul-Gumuz</option>
                                        <option value="GA">Gambela</option>
                                        <option value="">Any</option>
                                    </select>

 */