import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:freshlinks/screens/prod.dart';
import 'package:freshlinks/screens/sell.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selPg = 0;

  final _pages = [
    Prod(),
    Sell(),
    Prod()
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(  
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(30, 81, 40, 1),
              title: const Text('Home Page', style: TextStyle(color: Color.fromRGBO(216, 233, 168, 1))),
            ),
            body: _pages[selPg],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: const Color.fromRGBO(25, 26, 25, 1),
              animationDuration: const Duration(milliseconds: 300),
              color: const Color.fromRGBO(30, 81, 40, 1),
              items: const [
                Icon(
                  Icons.agriculture_rounded,
                  color: Color.fromRGBO(216, 233, 168, 1),
                ),
                Icon(
                  Icons.monetization_on_rounded,
                  color: Color.fromRGBO(216, 233, 168, 1),
                ),
                Icon(
                  Icons.settings_outlined,
                  color: Color.fromRGBO(216, 233, 168, 1),
                )
              ],
              onTap: (index) {
                setState(() {
                  selPg = index;
                });
              },
            ),
          );
        }
      ),
    );
  }
}