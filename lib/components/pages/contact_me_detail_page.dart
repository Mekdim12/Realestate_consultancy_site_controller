import 'package:flutter/material.dart';
import 'package:realstateconsultancy/components/pages/contact_page.dart';
import '../../services/service_api_data_add_and_updater.dart';
import '../../models/contactsMe.dart';

typedef OnUpdateCallback = Function(dynamic updatedObject);

class ContactMeDetailPage extends StatefulWidget {
  final contact_message;
  final OnUpdateCallback onUpdate;
  const ContactMeDetailPage(this.contact_message,
      {Key? key, required this.onUpdate})
      : super(key: key);

  @override
  State<ContactMeDetailPage> createState() => _ContactMeDetailPageState();
}

class _ContactMeDetailPageState extends State<ContactMeDetailPage> {
  ContactMeMessage? contactObject;
  ApiDataUploaderAndUpdater deleteContactInformation =
      ApiDataUploaderAndUpdater();

  @override
  void initState() {
    super.initState();
    setState(() {
      contactObject = widget.contact_message;
    });
  }

  void saveChanges() {
    if (widget.onUpdate != null) {
      widget.onUpdate!(contactObject);
    }
  }

  @override
  Widget build(BuildContext context) {
    final contact_message = widget.contact_message;
    final screenHeight = MediaQuery.of(context).size.height;
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
                  Container(
                    child: Text(
                      "Full Name :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Container(
                    child: Text(
                      contact_message.clientFullName,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      "Client Email :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Container(
                    child: Text(
                      contact_message.clientEmail,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      "Message Subject :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Container(
                    child: Text(
                      contact_message.clientSubjectOfMessage,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      "Full Message :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ),
                  Container(
                      width: screenwidth * 0.55,
                      child: Text(
                        contact_message.clienFullMessage,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        softWrap: true,
                        maxLines: 150,
                        overflow: TextOverflow.fade,
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  bool response = await deleteContactInformation
                      .deleteContactInformation(contact_message.id, '1');
                  if (response == true) {
                    saveChanges();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                          const SnackBar(
                              content: Text("Contact Information Deleted")),
                        )
                        .closed
                        .then((_) {
                      Navigator.pop(context);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Contact Information not Deleted")));
                  }
                },
                icon:const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                label: Text("Delete"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
              )
            ],
          ),
        ));
  }
}
