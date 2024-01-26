//  pass context either you use this either to update and delete the brouchers info other wise to upload some
//  like 1 with id and everything to be updated and deleted 
// 2 for adding new item with floating button

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BrouchersDetailPage extends StatefulWidget {
  const BrouchersDetailPage(this.isPageAddItem, {super.key});
  final bool isPageAddItem;

  @override
  State<BrouchersDetailPage> createState() => _BrouchersDetailPageState();
}

class _BrouchersDetailPageState extends State<BrouchersDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}