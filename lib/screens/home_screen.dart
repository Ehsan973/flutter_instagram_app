import 'dart:ui';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              child: SizedBox(
                height: 100,
                child: _getStoryList(),
              ),
            ),
            _getPostList(),
          ],
        ),
      ),
    );
  }

  Container _getStoryList() {
    return Container(
      height: 88,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0
              ? _getAddStoryBox()
              : Column(
                  children: [
                    _getStoryBox(58),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Test',
                      style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  ListView _getPostList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 9,
      itemBuilder: (context, index) {
        return _getPost();
      },
    );
  }

  Widget _getPost() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _getPostHeader(),
            SizedBox(
              height: 22,
            ),
            _getPostBody(),
          ],
        ),
      ),
    );
  }

  Widget _getPostBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      height: 395,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/post_cover.png',
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image.asset('assets/images/icon_video.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/icon_hart.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '2.6 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_comments.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '1.5 K',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'GB',
                            ),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/icon_share.png'),
                      Image.asset('assets/images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPostHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(38),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'amirahmadadibi',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'GB',
                    fontSize: 12,
                  ),
                ),
                Text(
                  'امیراحمد ادیبی برنامه نویس موبایل',
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getStoryBox(double size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            color: Color(0xFFF35383),
            padding: EdgeInsets.all(4),
            strokeWidth: 2,
            dashPattern: [40, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                color: Colors.amber,
                width: size,
                height: size,
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            width: 66,
            height: 66,
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
          ),
          SizedBox(height: 10),
          Text(
            'Your Story',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'GM',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
