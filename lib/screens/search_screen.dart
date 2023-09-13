import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchBox(),
            ),
            SliverToBoxAdapter(
              child: _getCategoryList(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              sliver: _getPostGridWithSliver(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPostGridWithSliver() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/item${index % 10}.png',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          QuiltedGridTile(2, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
    );
  }

  Widget _getPostGrid() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              QuiltedGridTile(2, 1),
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/item${index % 10}.png',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 17,
      ),
      width: double.infinity,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Color(0xff272B40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Image.asset('assets/images/icon_search.png'),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'GB',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Image.asset('assets/images/icon_scan.png'),
          ],
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 12,
        left: 9,
      ),
      child: Container(
        height: 24,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 60,
              decoration: BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Center(
                child: Text(
                  'Account',
                  style: TextStyle(
                    fontFamily: 'GM',
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
