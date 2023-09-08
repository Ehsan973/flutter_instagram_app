import 'package:dotted_border/dotted_border.dart';
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
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('assets/images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('assets/images/icon_direct.png'),
          )
        ],
      ),
      backgroundColor: Color(0xFF1C1F2E),
      body: Center(
        child: _getStoryBox(),
      ),
    );
  }

  DottedBorder _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      color: Color(0xFFF35383),
      padding: EdgeInsets.all(4),
      strokeWidth: 2,
      dashPattern: [50, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          color: Colors.amber,
          width: 58,
          height: 58,
          child: Image.asset('assets/images/profile.png'),
        ),
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      padding: EdgeInsets.all(2),
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
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
    );
  }
}
