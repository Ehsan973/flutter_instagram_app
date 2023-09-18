import 'package:flutter/material.dart';
import 'package:instagram_app/screens/activity_screen.dart';
import 'package:instagram_app/screens/add_content_screen.dart';
import 'package:instagram_app/screens/home_screen.dart';
import 'package:instagram_app/screens/search_screen.dart';
import 'package:instagram_app/screens/user_profile_sceen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationBarItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff272B40),
          currentIndex: _selectedBottomNavigationBarItem,
          onTap: (int index) {
            setState(
              () {
                _selectedBottomNavigationBarItem = index;
              },
            );
          },
          selectedFontSize: 15,
          selectedIconTheme: IconThemeData(
            color: Colors.red,
          ),
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          //
          unselectedFontSize: 10,
          unselectedItemColor: Colors.blueGrey,
          //
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_home.png'),
              activeIcon: Image.asset('assets/images/icon_active_home.png'),
              label: 'Item1',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_search_navigation.png'),
              activeIcon: Image.asset(
                  'assets/images/icon_search_navigation_active.png'),
              label: 'Item2',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_add_navigation.png'),
              activeIcon:
                  Image.asset('assets/images/icon_add_navigation_active.png'),
              label: 'Item3',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/icon_activity_navigation.png'),
              activeIcon: Image.asset(
                  'assets/images/icon_activity_navigation_active.png'),
              label: 'Item4',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffC5C5C5),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'assets/images/profile.png',
                  ),
                ),
              ),
              activeIcon: Container(
                padding: EdgeInsets.all(0),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: Color(0xffF35383),
                    ),
                    borderRadius: BorderRadius.circular(6)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset('assets/images/profile.png'),
                ),
              ),
              label: 'Item5',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationBarItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
