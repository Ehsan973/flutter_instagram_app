import 'package:flutter/material.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({super.key});

  @override
  State<AddContentScreen> createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  int selected_image_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _getWholeScrollingPart(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 55),
            decoration: BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Draft',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'GB',
                    ),
                  ),
                  Text(
                    'Gallary',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'GB',
                    ),
                  ),
                  Text(
                    'Take',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'GB',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomScrollView _getWholeScrollingPart() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeaderSection(),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImage(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected_image_index = index % 10;
                  });
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/item${index % 10}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              childCount: 40,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: 100,
          ),
        ),
      ],
    );
  }

  Container _getSelectedImage() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18,
      ),
      height: 390,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          'assets/images/item${selected_image_index}.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getHeaderSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 26,
        horizontal: 18,
      ),
      child: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'GB',
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('assets/images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'GB',
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset('assets/images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }
}
