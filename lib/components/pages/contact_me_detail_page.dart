import 'package:flutter/material.dart';
import 'package:realstateconsultancy/components/pages/contact_page.dart';

class ContactMeDetailPage extends StatefulWidget {
  final contact_message;
  const ContactMeDetailPage( this.contact_message ,{super.key});

  @override
  State<ContactMeDetailPage> createState() => _ContactMeDetailPageState();
}

class _ContactMeDetailPageState extends State<ContactMeDetailPage> {
  @override
  Widget build(BuildContext context) {
    final contact_message = widget.contact_message;
    final  screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Contact Me Detail Page"),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: screenHeight,
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( child:Text("Full Name :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),
                  Container(margin:const EdgeInsets.symmetric(horizontal: 10),),
                  Container( child: Text(contact_message.clientFullName, style: TextStyle(fontWeight: FontWeight.w500),),)
                ],
              ),
              Container(margin: EdgeInsets.symmetric(vertical: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( child:Text("Client Email :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),
                  Container(margin:const EdgeInsets.symmetric(horizontal: 10),),
                  Container( child: Text(contact_message.clientEmail, style: TextStyle(fontWeight: FontWeight.w500),),)
                ],
              ),
             
              Container(margin: EdgeInsets.symmetric(vertical: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( child:Text("Message Subject :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),
                  Container(margin:const EdgeInsets.symmetric(horizontal: 10),),
                  Container( child: Text(contact_message.clientSubjectOfMessage, style: TextStyle(fontWeight: FontWeight.w500),),)
                ],
              ),
              Container(margin: EdgeInsets.symmetric(vertical: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( child:Text("Full Message :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),
                  Container(margin:const EdgeInsets.symmetric(horizontal: 10),),
                  Container( child: Text(contact_message.clienFullMessage, style: TextStyle(fontWeight: FontWeight.w500),),)
                ],
              ),
              Container(margin: EdgeInsets.symmetric(vertical: 5),),

             ElevatedButton.icon(onPressed: ()=>{}, icon: Icon(Icons.delete), label:Text("Delete"))
          ],
        ),
      )
    );
  }
}