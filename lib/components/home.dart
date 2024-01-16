import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
      index: 2,
       backgroundColor: Colors.white,
       color:Colors.purple,
       animationDuration:const Duration(milliseconds: 200),
       onTap: (value) {
         
       },
       items: const [
        Icon(Icons.post_add, color: Colors.white),
        Icon(Icons.add_card, color: Colors.white),
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.contact_page, color: Colors.white),
        Icon(Icons.settings, color: Colors.white)
       ],

      ),
    );
  }
}

/*
  - new brouchers or offers 
  - properties 
      - vehicles
      - realestate
  - contact us form 
  - list of request call 
 */