import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ContactUserPage extends StatefulWidget {
  const ContactUserPage({super.key});

  @override
  State<ContactUserPage> createState() => _ContactUserPageState();
}

class _ContactUserPageState extends State<ContactUserPage> {
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
            backgroundColor: Colors.white70,
            bottom: const TabBar(
              // indicatorColor: Colors.greenAccent,
              dividerColor: Colors.deepPurple,
              // labelColor: Colors.greenAccent,
              // indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.purple,
              tabs: [
                Tab(
                    text: "Text Based",
                    icon: Icon(
                      Icons.contact_mail,
                      color: Colors.purple,
                    )),
                Tab(
                  iconMargin: EdgeInsets.all(5),
                  text: "Image Based",

                  icon: Icon(
                    Icons.call,
                    color: Colors.purple,
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(children: [Text("data"), Text("2")]),
        ),
      ),
    );
  }
}
