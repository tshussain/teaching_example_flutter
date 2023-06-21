import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/MainLayout.dart';

import 'model/UserRepository.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "Home",
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Provider.of<UserRepository>(context).db.writeData();
                },
                child: const Text("Add data")),
            TextButton(
                onPressed: () {
                  Provider.of<UserRepository>(context).db.readData();
                },
                child: const Text("Get data")),
            const Text("Home page contents")
          ],
        ));
  }
}
