import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PropertiesDetailPage extends StatefulWidget {
  final propertyObject;

  const PropertiesDetailPage(this.propertyObject, {super.key});

  @override
  State<PropertiesDetailPage> createState() => _PropertiesDetailPageState();
}

class _PropertiesDetailPageState extends State<PropertiesDetailPage> {
  @override
  Widget build(BuildContext context) {
    final propertyObject = widget.propertyObject;
    
    print(propertyObject);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Property Detail"),
        ),
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
