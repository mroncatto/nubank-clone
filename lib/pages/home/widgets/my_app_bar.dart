// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.showMenu, required this.onTap});
  final bool showMenu;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).padding.top,
      ),
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * .20,
          color: Colors.purple[800],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      'https://logodownload.org/wp-content/uploads/2019/08/nubank-logo-3.png',
                      height: 35,
                      color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Marcelo',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              Icon(!showMenu ? Icons.expand_more : Icons.expand_less)
            ],
          ),
        ),
      )
    ]);
  }
}
