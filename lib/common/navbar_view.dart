import 'package:flutter/material.dart';
import 'package:help_mate/Dashboard/dashboardView.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavBarView> {
  int _selectedIndex = 0;

  final _screens = [
    DashboardView(),
    const Scaffold(
      body: Center(
        child: Text('Search'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Wallet'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
              activeIcon: Icon(Icons.search)),
          BottomNavigationBarItem(
              icon: Icon(Icons.money_outlined),
              label: 'Wallet',
              activeIcon: Icon(Icons.money)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              activeIcon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
