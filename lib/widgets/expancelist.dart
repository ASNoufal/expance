import 'package:expence_app/widgets/expance_item.dart';
import 'package:expence_app/model/expances.dart';
import 'package:expence_app/widgets/expance_page.dart';
import 'package:flutter/material.dart';

class ExpanceList extends StatelessWidget {
  const ExpanceList(
      {super.key, required this.list, required this.removeAddExpance});
  final List<Expances> list;
  final void Function(Expances expance) removeAddExpance;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                removeAddExpance(list[index]);
              },
              key: ValueKey(list[index]),
              child: ExpanceItem(items: list[index]));
        });
  }
}
