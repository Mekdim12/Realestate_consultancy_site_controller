import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 15),
              child: const Text(
                "STATUS",
                style: TextStyle(
                    color: Color.fromARGB(159, 72, 59, 6),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 5),
              child: Row(
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF483b06)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: screenWidth * 0.8,
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
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 25),
              child: Row(
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF483b06)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: screenWidth * 0.8,
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
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 25),
              child: Row(
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF483b06)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: screenWidth * 0.8,
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
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.only(top: 25),
              child: ElevatedButton(
                style: const ButtonStyle(
                  alignment: Alignment.bottomCenter,
                  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                  elevation: MaterialStatePropertyAll(15),
                ),
                onPressed: () {},
                child: const Text("Update")))
          ],
        ),
      ),
    );
  }
}
