import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumericScreen extends StatefulWidget {
  const NumericScreen({super.key});

  @override
  State<NumericScreen> createState() => _NumericScreenState();
}

class _NumericScreenState extends State<NumericScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('numericScreen'.tr),
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
