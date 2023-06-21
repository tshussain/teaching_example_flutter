

import 'package:flutter/material.dart';

import 'MainLayout.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
        title: "Contact Us",
        child: Text("Hi.  We're cool - no, really we are.")
    );
  }
}