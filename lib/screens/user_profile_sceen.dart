import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Center(
          child: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    // pinned: true,
                    toolbarHeight: 60,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, right: 18),
                        child: Icon(Icons.menu),
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(10),
                      child: Container(
                        height: 14,
                        decoration: BoxDecoration(
                          color: Color(0xff1C1F2E),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: Color(0xff1C1F2E),
                    expandedHeight: 170,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        'assets/images/item1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: _getHeaderProfile(),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    // floating: true,
                    delegate: TabBarViewDelegate(
                      TabBar(
                        indicatorColor: Color(0xffF35383),
                        tabs: [
                          Tab(
                            icon:
                                Image.asset('assets/images/icon_tab_posts.png'),
                          ),
                          Tab(
                            icon: Image.asset(
                                'assets/images/icon_tab_bookmark.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        sliver: _getPostGrid(),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        sliver: _getPostGrid(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverGrid _getPostGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/item${index % 10}.png',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        pattern: [
          QuiltedGridTile(1, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Color(0xffF35383),
              ),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'امیراحمد برنامه نویس موبایل',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'amirahmadadibi',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 12,
                    color: Color(0xffC5C5C5),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_profile_edit.png'),
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  TabBarViewDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
