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
  double _yPosition = 0;

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == 0) {
      _yPosition = _screenHeight * .24;
    }
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(alignment: Alignment.topCenter, children: [
        MyAppBar(
          showMenu: _showMenu,
          onTap: () {
            setState(() {
              _showMenu = !_showMenu;
              _yPosition =
                  _showMenu ? _screenHeight * .75 : _screenHeight * .24;
            });
          },
        ),
        PageViewApp(
          showMenu: _showMenu,
          top: _yPosition,
          onChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          onPanUpdate: (details) {
            double positionBottomLimit = _screenHeight * .75;
            double positionTopLimit = _screenHeight * .24;
            double middlePosition = positionBottomLimit - positionTopLimit;
            middlePosition = middlePosition / 2;
            setState(() {
              _yPosition += details.delta.dy;

              _yPosition =
                  _yPosition < positionTopLimit ? positionTopLimit : _yPosition;

              _yPosition = _yPosition > positionBottomLimit
                  ? positionBottomLimit
                  : _yPosition;

              if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                _yPosition = _yPosition > positionTopLimit + middlePosition - 50
                    ? positionBottomLimit
                    : _yPosition;
              }

              if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                _yPosition = _yPosition < positionBottomLimit - middlePosition
                    ? positionTopLimit
                    : _yPosition;
              }

              if (_yPosition == positionBottomLimit) {
                _showMenu = true;
              } else if (_yPosition == positionTopLimit) {
                _showMenu = false;
              }
            });
          },
        ),
        MyDotsApp(
          top: _screenHeight * .70,
          currentIndex: _currentIndex,
        )
      ]),
    );
  }
}
