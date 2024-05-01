import 'dart:async';

import 'package:flutter/material.dart';
import 'call_request_detail_page.dart';
import 'contact_me_detail_page.dart';
import '../../services/service_api_data_fetcher.dart';
import '../../models/contactsMe.dart';
import '../../models/clientCallRequest.dart';

class ContactUserPage extends StatefulWidget {
  const ContactUserPage({super.key});

  @override
  State<ContactUserPage> createState() => _ContactUserPageState();
}

class _ContactUserPageState extends State<ContactUserPage> {
  ApiFetcherService apiService = ApiFetcherService();
  List LIST_OF_REQUESTED_PHONE_CALL = [];
  List LIST_OF_CONTACT_ME_MESSAGES = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      LIST_OF_REQUESTED_PHONE_CALL;
      LIST_OF_CONTACT_ME_MESSAGES;
    });
    fetchData();
    Timer.periodic(Duration(seconds: 120), (timer) {
      fetchData();
    });
    
  }

  Future<void> fetchData() async {
    try {
      List response = await apiService.fetchContactInformation();
      LIST_OF_REQUESTED_PHONE_CALL = response[1];
      LIST_OF_CONTACT_ME_MESSAGES = response[0];
      setState(() {
        LIST_OF_REQUESTED_PHONE_CALL;
        LIST_OF_CONTACT_ME_MESSAGES;
      });
    } catch (error) {
      // Handle the error here
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
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
                ? Container(
                    margin: const EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 30),
                    height: screenHeight - 400,
                    child: ListView.builder(
                        itemCount: LIST_OF_CONTACT_ME_MESSAGES.length,
                        itemBuilder: (context, index) {
                          var currentItem = LIST_OF_CONTACT_ME_MESSAGES[index];
                          return ListTile(
                            onTap: () => {},
                            iconColor: Colors.purple,
                            selectedColor: Colors.deepPurple,
                            enableFeedback: true,
                            hoverColor: const Color.fromARGB(89, 104, 58, 183),
                            contentPadding: const EdgeInsets.all(5),
                            title: Text(
                              currentItem.clientFullName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.purple),
                            ),
                            subtitle: (currentItem.clientSubjectOfMessage
                                        .toString()
                                        .length >
                                    50)
                                ? Text(
                                    "${currentItem.clientSubjectOfMessage.toString().substring(0, 50)}...")
                                : Text(
                                    "${currentItem.clientSubjectOfMessage.toString().substring(0, currentItem.clientSubjectOfMessage.toString().length)}...",
                                  ),
                            trailing: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ContactMeDetailPage(
                                          currentItem,
                                          onUpdate: (updatedObject) {
                                            if (updatedObject
                                                is ContactMeMessage) {
                                              setState(() {
                                                int index =
                                                    LIST_OF_CONTACT_ME_MESSAGES
                                                        .indexWhere((item) =>
                                                            item.id ==
                                                            updatedObject.id);
                                                if (index != -1) {
                                                  LIST_OF_CONTACT_ME_MESSAGES
                                                      .removeAt(index);
                                                  setState(() {
                                                    LIST_OF_CONTACT_ME_MESSAGES;
                                                  });
                                                }
                                              });
                                            }
                                          },
                                        )));
                              },
                              icon:
                                  const Icon(Icons.arrow_circle_right_rounded),
                              label: const Text(''),
                            ),
                          );
                        }),
                  )
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
            (LIST_OF_REQUESTED_PHONE_CALL.length > 0)
                ? Container(
                    margin: const EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 30),
                    height: screenHeight - 400,
                    child: ListView.builder(
                        itemCount: LIST_OF_REQUESTED_PHONE_CALL.length,
                        itemBuilder: (context, index) {
                          var currentItem = LIST_OF_REQUESTED_PHONE_CALL[index];
                          return ListTile(
                            onTap: () => {},
                            iconColor: Colors.purple,
                            selectedColor: Colors.deepPurple,
                            enableFeedback: true,
                            hoverColor: const Color.fromARGB(89, 104, 58, 183),
                            contentPadding: const EdgeInsets.all(5),
                            title: Text(
                              currentItem.clientName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.purple),
                            ),
                            subtitle: (currentItem.typeOfAnItem
                                        .toString()
                                        .length >
                                    50)
                                ? Text(
                                    "${currentItem.typeOfAnItem.toString().substring(0, 50)}...")
                                : Text(
                                    "${currentItem.typeOfAnItem.toString().substring(0, currentItem.typeOfAnItem.toString().length)}..."),
                            trailing: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CallRequestDetailPage(currentItem,
                                            onUpdate: (updatedObject) {
                                          if (updatedObject
                                              is CallRequestedClient) {
                                            setState(() {
                                              int index =
                                                  LIST_OF_REQUESTED_PHONE_CALL
                                                      .indexWhere((item) =>
                                                          item.id ==
                                                          updatedObject.id);
                                              if (index != -1) {
                                                LIST_OF_REQUESTED_PHONE_CALL
                                                    .removeAt(index);
                                                setState(() {
                                                  LIST_OF_REQUESTED_PHONE_CALL;
                                                });
                                              }
                                            });
                                          }
                                        })));
                              },
                              icon:
                                  const Icon(Icons.arrow_circle_right_rounded),
                              label: const Text(''),
                            ),
                          );
                        }),
                  )
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
