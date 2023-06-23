import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DisplayUserGrid.dart';
import 'model/Profile.dart';
import 'model/ProfileRepository.dart';

class UserGrid extends StatelessWidget {
  const UserGrid({super.key});

  /// Uses a FutureBuilder to get the data for all users from the repository
  ///  and then calls DisplayUserGrid
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Profile>>(
        future: Provider.of<ProfileRepository>(context, listen: true)
            .getAllUsers(),
        builder: (context, AsyncSnapshot<List<Profile>> users) {
          if (!users.hasData) {
            return CircularProgressIndicator();
          } else {
            return DisplayUserGrid(users : users.data!);
          }
        }
    );
  }
}
