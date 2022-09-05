import 'package:flutter/material.dart';
import 'package:nubank/pages/home/widgets/my_app_bar.dart';
import 'package:nubank/pages/home/widgets/my_dots_app.dart';
import 'package:nubank/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu = false;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(alignment: Alignment.topCenter, children: [
        MyAppBar(
          showMenu: _showMenu,
          onTap: () {
            setState(() {
              _showMenu = !_showMenu;
            });
          },
        ),
        PageViewApp(
          top: _screenHeight * .24,
          onChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        Positioned(
          top: _screenHeight * .70,
          child: MyDotsApp(
            currentIndex: _currentIndex,
          ),
        )
      ]),
    );
  }
}
