import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DisplayUserCard.dart';
import 'MainLayout.dart';
import 'model/User.dart';
import 'model/UserRepository.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "Display User",
        child: FutureBuilder<User>(
            future: Provider.of<UserRepository>(context, listen: false)
                .getFixedUser(),
            builder: (context, AsyncSnapshot<User> user) {
              if (!user.hasData) {
                return CircularProgressIndicator();
              } else {
                return DisplayUserCard(user: user.data!);
              }
            }));
  }
}
