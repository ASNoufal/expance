import 'package:expence_app/model/expances.dart';
import 'package:flutter/material.dart';

class ExpanceItem extends StatelessWidget {
  const ExpanceItem({required this.items, super.key});
  final Expances items;

  @override
  Widget build(context) {
    var iconss = catagorylist[items.catagory];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            children: [
              Text(items.title),
              Row(
                children: [
                  Text("\$${items.amount.toStringAsFixed(2)}"),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(iconss),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(items.setdate)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
