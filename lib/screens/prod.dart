import 'package:flutter/material.dart';
import 'package:freshlinks/fetch.dart';

class Prod extends StatelessWidget {
  const Prod({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Fetch(),
      backgroundColor: const Color.fromRGBO(25, 26, 25, 1),
    );
  }
}