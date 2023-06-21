import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/MainLayout.dart';

import 'DisplayUserGrid.dart';
import 'model/UserRepository.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "Home",
        child:  Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Users');
                },
                child: const Text("Users")),
           ],
        ));
  }
}
