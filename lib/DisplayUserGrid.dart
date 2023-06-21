import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/model/UserRepository.dart';
import 'package:intl/intl.dart';

import 'DisplayUserCard.dart';
import 'model/User.dart';

class DisplayUserGrid extends StatelessWidget {
  const DisplayUserGrid({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            // TODO: Build a grid of cards (102)
            children: _buildGridCards(context: context, users: users)));
  }

  List<Widget> _buildGridCards(
      {required BuildContext context, required List<User>? users}) {
    if (users == null || users.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    List<Widget> cards = users.map((user) {
      return DisplayUserCard(user: user);
    }).toList();
    return cards;
  }
}
