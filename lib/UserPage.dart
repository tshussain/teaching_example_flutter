import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DisplayUserCard.dart';
import 'MainLayout.dart';
import 'model/Profile.dart';
import 'model/ProfileRepository.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  /// Page that get a user and displays the user in a card
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "Display User",
        child: FutureBuilder<Profile>(
            future: Provider.of<ProfileRepository>(context, listen: false)
                .getFixedUser(),
            builder: (context, AsyncSnapshot<Profile> user) {
              if (!user.hasData) {
                return CircularProgressIndicator();
              } else if (user.data!.isNoUser()) {
                return Text("User not found");
              }
              else {
                return DisplayUserCard(user: user.data!);
              }
            }));
  }
}
