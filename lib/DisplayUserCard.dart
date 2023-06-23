import 'package:flutter/material.dart';

import 'model/Profile.dart';

class DisplayUserCard extends StatelessWidget {
  const DisplayUserCard({super.key, required this.user});

  final Profile user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
        width: 300,
        child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Ternary operator that check if an image is available
          user.image == null || user.image!.isEmpty
              ? Text("No Image")
              : AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.network(user.image!),
                ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Username: ${user.username}"),
                SizedBox(height: 8.0),
                Text("  ${user.first} ${user.last == null ? "" : user.last!}"),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
