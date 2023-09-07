import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(2),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFF1C1F2E),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset('assets/images/icon_plus.png'),
          ),
        ),
      ),
    );
  }
}
