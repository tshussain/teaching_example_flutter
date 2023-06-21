import 'package:flutter/material.dart';

import 'MainLayout.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: "Contact Us",
      child: Text("Hi.  Please call us.")
    );
  }
}
