import 'package:flutter/material.dart';
import 'package:coffe_plot_frontend/services/auth_helper.dart';
import 'package:coffe_plot_frontend/pages/home_page.dart';
import 'package:coffe_plot_frontend/pages/listings_page.dart';
import 'package:coffe_plot_frontend/pages/stats_page.dart';
import 'package:coffe_plot_frontend/pages/login_signup.dart';
import 'package:coffe_plot_frontend/pages/favourites_page.dart';
import 'package:flutter_svg/svg.dart';

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  int _selectedIndex = 0;

  // List of pages to display based on the selected index.
  final List<Widget> _pages = [
    HomePage(),
    ListingPage(),
    FavoritesPage(),
    StatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFEFA),
        elevation: 0.0,
        leading: IconButton(
          icon: new Container(),
          onPressed: null,
        ),
        title: Center(
          child: SvgPicture.asset(
            'lib/svgs/toplogo.svg',
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthHelper.removeToken(); // remove the token
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginSignupPage()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color(0xFFFFFEFA),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0
                  ? 'lib/svgs/nav-icon-map-selected.svg'
                  : 'lib/svgs/Group21.svg',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1
                  ? 'lib/svgs/nav-icon-list-selected.svg'
                  : 'lib/svgs/Group22.svg',
            ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 2
                  ? 'lib/svgs/nav-icon-favorites-selected.svg'
                  : 'lib/svgs/Group20.svg',
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 3
                  ? 'lib/svgs/nav-icon-stats-selected.svg'
                  : 'lib/svgs/Group19.svg',
            ),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
