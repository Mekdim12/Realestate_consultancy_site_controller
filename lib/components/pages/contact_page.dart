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
    return const Text("Contacting page");
  }
}