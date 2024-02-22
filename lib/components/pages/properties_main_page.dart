import 'package:flutter/material.dart';

class PropertiesMainPage extends StatefulWidget {
  const PropertiesMainPage({super.key});

  @override
  State<PropertiesMainPage> createState() => _PropertiesMainPageState();
}

class _PropertiesMainPageState extends State<PropertiesMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.abc) , label: Text("mekdim"))
        ],
      ),
    );
  }
}