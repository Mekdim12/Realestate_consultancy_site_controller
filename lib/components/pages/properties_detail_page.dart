
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PropertiesDetailPage extends StatefulWidget {
  final flag;
  final id;

  const PropertiesDetailPage( this.flag, this.id ,{super.key});

  @override
  State<PropertiesDetailPage> createState() => _PropertiesDetailPageState();
}

class _PropertiesDetailPageState extends State<PropertiesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}