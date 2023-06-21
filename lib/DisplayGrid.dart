import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/model/UserRepository.dart';

import 'DisplayCard.dart';
import 'model/User.dart';

class DisplayGrid extends StatelessWidget {
  const DisplayGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      // TODO: Build a grid of cards (102)
      children: _buildGridCards(context)
    )
  }
}

Future<List<Widget>> _buildGridCards(BuildContext context) async {
  List<User> users = await Provider.of<UserRepository>(context).readData()

  List<Widget> cards = List.generate(
    5,
        (int index) {
      return DisplayCard(imageUrl:"Temp");
    },
  );
  return cards;
}
