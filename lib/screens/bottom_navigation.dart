import 'package:burger_app/screens/home_screen.dart' show HomeScreen;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<String> title = <String>['Home', 'Business', 'Account', 'More'];

  final List<String> icon = <String>['assets/icons/home.svg', 'assets/icons/favorite.svg', 'assets/icons/account.svg', 'assets/icons/more.svg'];

  final List<Widget> screens = <Widget>[HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        selectedIconTheme: IconThemeData(color: Color(0xffC8161D)),
        selectedItemColor: Color(0xffC8161D),
        unselectedItemColor: Color(0xff667C8A),
        items: List.generate(title.length, (index) {
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(icon[index],
              colorFilter: ColorFilter.mode(Color(_currentIndex == index ? 0xffC8161D : 0xff667C8A), BlendMode.srcIn),),
            label: title[index],
            backgroundColor: Colors.white
          );
        },),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
