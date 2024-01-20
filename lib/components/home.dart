import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'small_components/card.dart';

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
      body: CardWidget(500, 500) ,
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
        make sure there is onely 5 is submitted make sure there is some way to select for which part its is
  - properties 
        prepare form that accepts these type of properties using different page because they have different attributes and make sure there is at lease pciture uploaded on the ay 
      - vehicles
      - realestate
  - contact us form 
        list of messages from user option to delete and view is only needed
  - list of request call 
        list of name and number of user request call from agent and when reviewed , and option to delete that call request
 */


/*

required cards

tottal number of users ineracted with the forms
tottal number of user request call from agent
number of unread contacts us messages
numner of new request calls

 */

