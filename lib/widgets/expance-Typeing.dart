import 'package:expence_app/model/expances.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var format = DateFormat.yMd();

class ExpanceTyping extends StatefulWidget {
  const ExpanceTyping({super.key, required this.onAddExpance});

  final void Function(Expances expances) onAddExpance;

  @override
  State<ExpanceTyping> createState() => _ExpanceTypingState();
}

class _ExpanceTypingState extends State<ExpanceTyping> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? dateTime;
  Catagory nameCategory = Catagory.food;
  void submitselectebutton() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amount = enteredAmount == null;
    if (_textController.text.trim().isEmpty || amount || dateTime == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: const Text("Error"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("ok"))
              ],
            );
          });
    } else {
      widget.onAddExpance(Expances(
          title: _textController.text.trim(),
          amount: enteredAmount,
          date: DateTime.now(),
          catagory: nameCategory));
      Navigator.pop(context);
    }
  }

  void calanderButtonpressed() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      dateTime = date;
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(
          controller: _textController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text("title")),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(label: Text("amount")),
                controller: _amountController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(dateTime == null
                      ? "not selected"
                      : format.format(dateTime!)),
                  IconButton(
                      onPressed: calanderButtonpressed,
                      icon: const Icon(Icons.calendar_month))
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            DropdownButton(
                value: nameCategory,
                style: const TextStyle(color: Colors.blue),
                items: Catagory.values
                    .map((value) => DropdownMenuItem(
                        value: value, child: Text(value.name.toUpperCase())))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    nameCategory = value;
                  });
                }),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    submitselectebutton();
                  });
                },
                child: const Text("click")),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("cancel")),
          ],
        )
      ]),
    );
  }
}
