import 'package:flutter/material.dart';

class WritingPage extends StatelessWidget {
  const WritingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 153, 197),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: TextEditingController(),
                ),
              ),
            ),
            SizedBox(width: 150, child: TextField())
          ],
        ),
      ),
    );
  }
}
