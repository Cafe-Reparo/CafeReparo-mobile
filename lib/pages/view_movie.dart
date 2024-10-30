import 'package:flutter/material.dart';

class ViewBook extends StatefulWidget {
  const ViewBook({super.key});

  @override
  _ViewBookState createState() => _ViewBookState();
}

class _ViewBookState extends State<ViewBook> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("View Book"),
          ],
        ),
      ),
    );
  }
}
