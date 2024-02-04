import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'small_components/card.dart';
import 'pages/main_home_page.dart';
import 'pages/brouchers_page.dart';
import 'pages/contact_page.dart';
import 'pages/profile_page.dart';
import 'pages/properties_pages.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected_index_page_sync_value_holder  = 2; // default value is 2 for home page
 
  
  @override
  Widget build(BuildContext context) {
    // ApiFetcherService apiFetcherService = ApiFetcherService();

    final screen_pages = <Widget>[
        BrouchersPage(),
        PropertiesPage(),
        MainHomePage(),
        ContactUserPage(),
        ProfilePage()
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: Center(child: Column(
          children:  [
            Container(
                width: 55,
                height: 55,
                // co?lor: null,
                margin:const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,

                  image: AssetImage('assets/images/tg_main_logo.png'),
                    ),
              )    
              ),
            const Text("Home", style: TextStyle(fontSize: 12, color: Colors.white38) ,)
          ],
        
        )),
      ),
      backgroundColor: Colors.grey[50],
      body: IndexedStack(
        index: selected_index_page_sync_value_holder,
        children:screen_pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
      index: selected_index_page_sync_value_holder,
       backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
       color:Colors.purple,
       animationDuration:const Duration(milliseconds: 200),
       onTap: (index){
        setState(() {
           selected_index_page_sync_value_holder = index;
        });
       },
       items: const <Widget> [
        Icon(Icons.post_add, color: Colors.white),
        Icon(Icons.add_card, color: Colors.white),
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.message, color: Colors.white),
        Icon(Icons.account_circle_rounded, color: Colors.white)
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

