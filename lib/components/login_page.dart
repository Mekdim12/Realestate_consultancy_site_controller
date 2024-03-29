import 'package:flutter/material.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});
  @override
  State<LoginPageWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPageWidget> {
  bool userNameOrPasswordIncorrect = false;
  final _userNameOfAdmin = TextEditingController();
  final _passwordOfAdmin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const Text(
            "LOGIN",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.purple,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 35, top: 80),
            child: TextField(
                controller: _userNameOfAdmin,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:  BorderSide(color:(userNameOrPasswordIncorrect)? Colors.red:Colors.purple)),
                    icon: const Icon(Icons.abc),
                    iconColor: const Color.fromARGB(255, 85, 42, 92),
                    labelText: "User Name",
                    labelStyle: const TextStyle(
                      color: Colors.purple,
                    ),
                    hoverColor: Colors.amberAccent),
                cursorColor: Colors.black),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 35, top: 40),
            child: TextField(
              controller: _passwordOfAdmin,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
              decoration:  InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:(userNameOrPasswordIncorrect)? Colors.red:Colors.purple)),
                  icon: const Icon(Icons.password),
                  iconColor: const Color.fromARGB(255, 85, 42, 92),
                  labelText: "Password",
                  labelStyle:const TextStyle(
                    color: Colors.purple,
                  ),
                  hoverColor: Colors.amberAccent),
              cursorColor: Colors.black,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 80),
            child: ElevatedButton(
              onPressed: () => {
                if (_userNameOfAdmin.text.toString().trim().toLowerCase() == "admin" &&
                    _passwordOfAdmin.text.toString().trim().toLowerCase() == "admin"){
                      print("perform the authentication")
                  }else{
                    setState((){
                        userNameOrPasswordIncorrect =true;
                    })
                  }
              },
              style: ButtonStyle(
                  alignment: Alignment.center,
                  fixedSize: MaterialStateProperty.all(Size(200, 44)),
                  elevation: MaterialStateProperty.all(28),
                  backgroundColor: MaterialStateProperty.all(Colors.purple)),
              child: const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                    color: Color.fromARGB(255, 250, 249, 251),
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
