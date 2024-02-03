


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CallRequestDetailPage extends StatefulWidget {
  final requstedItem;
  const CallRequestDetailPage(this.requstedItem , {super.key});

  @override
  State<CallRequestDetailPage> createState() => _CallRequestDetailPageState();
}

class _CallRequestDetailPageState extends State<CallRequestDetailPage> {
  @override
  Widget build(BuildContext context) {
    final requestedItmObject = widget.requstedItem;
    final  screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Call Requests Detail"),
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
                  Container( child: Text(requestedItmObject.clientName, style: TextStyle(fontWeight: FontWeight.w500),),)
                ],
              ),
              Container(margin: EdgeInsets.symmetric(vertical: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( child:Text("Client Email :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),
                  Container(margin:const EdgeInsets.symmetric(horizontal: 10),),
                  Container( child: Text(requestedItmObject.clienEmail, style: TextStyle(fontWeight: FontWeight.w500),),)
                ],
              ),
             
              Container(margin: EdgeInsets.symmetric(vertical: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( child:Text("Proprty Type :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),
                  Container(margin:const EdgeInsets.symmetric(horizontal: 10),),
                  Container( child: Text(requestedItmObject.typeOfAnItem, style: TextStyle(fontWeight: FontWeight.w500),),)
                ],
              ),
              Container(margin: EdgeInsets.symmetric(vertical: 5),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container( child:Text("Phone Number :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),),
                  Container(margin:const EdgeInsets.symmetric(horizontal: 10),),
                  Container( child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(requestedItmObject.phoneNumber, style: TextStyle(fontWeight: FontWeight.w500),), Container(margin: EdgeInsets.symmetric(horizontal: 10),), ElevatedButton.icon(onPressed: (){}, style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.grey[50])),icon: Icon(Icons.copy, color: Colors.deepPurple,), label: Text(""))],
                  ),)
                ],
              ),
              
              Container(margin: EdgeInsets.symmetric(vertical: 50),),

             ElevatedButton.icon(onPressed: ()=>{}, icon: Icon(Icons.delete, color: Colors.white,), label:Text("Delete"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),)
          ],
        ),
      )
    );
 
  }
}