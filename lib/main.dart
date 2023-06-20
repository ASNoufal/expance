import 'package:expence_app/widgets/expance_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        body: Expance(),
      )));
}
