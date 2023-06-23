

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DisplayUserGrid.dart';
import 'MainLayout.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return MainLayout(
        title: "About Us",
        child: firebaseUser == null ? Text("Not logged in - Please do so.") : Text("Hi.  We're cool - no, really we are.")
    );
  }
}
