import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ContactUserPage extends StatefulWidget {
  const ContactUserPage({super.key});

  @override
  State<ContactUserPage> createState() => _ContactUserPageState();
}

class CallRequestedClient {
  final bool status;
  final String typeOfAnItem;
  final String id;
  final String clientName;
  final String clienEmail;

  const CallRequestedClient(
      {required this.status,
      required this.typeOfAnItem,
      required this.id,
      required this.clientName,
      required this.clienEmail});
}

class ContactMeMessage {
  final String clientFullName;
  final String clientEmail;
  final String clientSubjectOfMessage;
  final String clienFullMessage;

  const ContactMeMessage(
      {required this.clientFullName,
      required this.clientEmail,
      required this.clientSubjectOfMessage,
      required this.clienFullMessage});
}

class _ContactUserPageState extends State<ContactUserPage> {
  //  list mock data
  final LIST_OF_REQUESTED_PHONE_CALL = [
    const CallRequestedClient(
      status: true,
      typeOfAnItem: "Real-estate",
      id: "015",
      clientName: "Mekdim Tamirat",
      clienEmail: "mekdim@yahoo.com",
    ),
    const CallRequestedClient(
      status: true,
      typeOfAnItem: "Vehicle",
      id: "555",
      clientName: "Mekdim Tamirat",
      clienEmail: "mekdim@yahoo.com",
    ),
    const CallRequestedClient(
      status: true,
      typeOfAnItem: "Real-estate",
      id: "55",
      clientName: "Mekdim Tamirat",
      clienEmail: "mekdim@yahoo.com",
    )
  ];

  final LIST_OF_CONTACT_ME_MESSAGES = [
    const ContactMeMessage(
        clienFullMessage: "LORE IPSUMMMMMMMMMMMMMMMMMMM",
        clientEmail: "MEKDIM@GMAIL",
        clientFullName: "mekdim Tamirat",
        clientSubjectOfMessage: "my message"),
    const ContactMeMessage(
        clienFullMessage: "LORE IPSUMMMMMMMMMMMMMMMMMMM",
        clientEmail: "MEKDIM@GMAIL",
        clientFullName: "Tamirat",
        clientSubjectOfMessage: "my message"),
    const ContactMeMessage(
        clienFullMessage: "LORE IPSUMMMMMMMMMMMMMMMMMMM",
        clientEmail: "MEKDIM@GMAIL",
        clientFullName: "Hasset Tamirat",
        clientSubjectOfMessage: "my message"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: double.infinity,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            bottom: const TabBar(
              indicatorColor: Colors.deepPurple,
              dividerColor: Colors.deepPurple,
              labelColor: Colors.purple,
              tabs: [
                Tab(
                    text: "Contact Me",
                    icon: Icon(
                      Icons.contact_mail,
                      color: Colors.purple,
                    )),
                Tab(
                  iconMargin: EdgeInsets.all(5),
                  text: "Call Request",
                  icon: Icon(
                    Icons.call,
                    color: Colors.purple,
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            (LIST_OF_CONTACT_ME_MESSAGES.length > 0)
                ? Text("data")
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                            image: AssetImage("assets/images/not_found.png")),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        const Text(
                          "There Is No New Message",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
            (LIST_OF_REQUESTED_PHONE_CALL.length > 0)?Text("ME"): Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                            image: AssetImage("assets/images/not_found.png")),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        const Text(
                          "There Is No New Client Request For Contacting",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
          ]),
        ),
      ),
    );
  }
}
