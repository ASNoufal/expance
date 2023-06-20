import 'package:expence_app/widgets/expance-Typeing.dart';
import 'package:expence_app/widgets/expancelist.dart';
import 'package:expence_app/model/expances.dart';
import 'package:flutter/material.dart';

class Expance extends StatefulWidget {
  const Expance({
    super.key,
  });
  @override
  State<Expance> createState() {
    return _Expance();
  }
}

class _Expance extends State<Expance> {
  final List<Expances> _listitems = [
    Expances(
        title: "hello",
        amount: 23,
        catagory: Catagory.food,
        date: DateTime.now()),
    Expances(
        title: "haii",
        amount: 20,
        catagory: Catagory.leisure,
        date: DateTime.utc(2019))
  ];
  void snackbar() {
    showBottomSheet(
        context: context,
        builder: (ctx) {
          return ExpanceTyping(
            onAddExpance: onAddExpance,
          );
        });
  }

  void onAddExpance(Expances expances) {
    setState(() {
      _listitems.add(expances);
    });
  }

  void removeAddExpance(Expances expances) {
    setState(() {
      _listitems.remove(expances);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 6, 75),
        title: const Text("Flutter Expensive Tracker"),
        actions: [IconButton(onPressed: snackbar, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: ExpanceList(
              list: _listitems,
              removeAddExpance: removeAddExpance,
            ))
          ],
        ),
      ),
    );
  }
}
