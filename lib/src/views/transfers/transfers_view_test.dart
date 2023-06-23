import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/src/views/transfers/table_transfers.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransfersViewTest extends StatefulWidget {
  const TransfersViewTest({super.key});

  @override
  State<TransfersViewTest> createState() => _TransfersViewTestState();
}

class _TransfersViewTestState extends State<TransfersViewTest> {
  @override
  Widget build(BuildContext context) {
    
    return TableTransfers();
  }
}