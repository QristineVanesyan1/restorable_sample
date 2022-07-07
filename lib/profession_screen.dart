import 'package:flutter/material.dart';

class ProfessionScreen extends StatefulWidget {
  const ProfessionScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionScreen> createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'First Name'),
          ),
        ),
      ),
    );
  }
}
