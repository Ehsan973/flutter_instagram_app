import 'package:flutter/material.dart';
import 'package:instagram_app/model/enum/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: Color(0xff1C1F2E),
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 16,
                  color: Color(0xFFC5C5C5),
                ),
                indicatorColor: Color(0xffF35383),
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 18),
                tabs: [
                  Tab(
                    text: 'You',
                  ),
                  Tab(
                    text: 'Following',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 32, left: 30, bottom: 10),
            child: Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.likes);
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 32, left: 30, bottom: 10),
            child: Text(
              'Today',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.followBack);
            },
            childCount: 3,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 32, left: 30, bottom: 10),
            child: Text(
              'This week',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'GB',
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.following);
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            margin: EdgeInsets.only(right: 7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF35383),
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AmirahmadAdibi',
                style: TextStyle(
                    fontFamily: 'GB', fontSize: 12, color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    'started following you',
                    style: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 12,
                        color: Color(0xffC5C5C5)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 10,
                        color: Color(0xffC5C5C5)),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return _getFollowButton();
      case ActivityStatus.following:
        return _getMessageButton();
      case ActivityStatus.likes:
        return _getPoster();
      default:
        return _getMessageButton();
    }
  }

  Widget _getFollowButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Follow'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget _getMessageButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        'Message',
        style: TextStyle(
          fontFamily: 'GB',
          fontSize: 12,
        ),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xffC5C5C5),
        side: BorderSide(
          width: 2,
          color: Color(0xffC5C5C5),
        ),
      ),
    );
  }

  Widget _getPoster() {
    return SizedBox(
      width: 40,
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          'assets/images/item1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
