import 'package:flutter/material.dart';

class NavBar extends StatefulWidget{
    const NavBar({Key? key, required this.initialIndex}) : super(key: key);
    final int initialIndex;

    @override
    State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  int _bottomNavBarIndex = 0;
  List<String> routes = [
    '/news',
    '/exchange',
    '/home',
    '/settings',
    '/account'
  ];


  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.initialIndex,
        onTap: (int index) {
          setState(() {
            _bottomNavBarIndex = index;
            Navigator.pushReplacementNamed(context, routes[index]);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: "Новости",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange_outlined),
            label: "Курсы валют",  
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Настройки",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Профиль",
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color.fromARGB(255, 141, 147, 171),
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 34, 34, 54),
      );
  }
}