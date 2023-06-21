
import 'package:flutter/material.dart';

import 'MainLayout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Login",
      child: Column(
        children: <Widget>[
          // [Name]
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              filled: true, // means the background of the text is lightly filled in to help user recognize the tap/touch area of the text field
              labelText: 'Username',
            ),
          ),
          // spacer
          SizedBox(height: 12.0),
          // [Password]
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Password',
            ),
            obscureText: true, // Automatically rep[laces the input the user types with bullets
          ),

          OverflowBar(
            alignment: MainAxisAlignment.end,
            // TODO: Add a beveled rectangular border to CANCEL (103)
            children: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  _usernameController.clear();
                  _passwordController.clear();
                },
              ),
              // TODO: Add an elevation to NEXT (103)
              // TODO: Add a beveled rectangular border to NEXT (103)
              ElevatedButton(
                child: const Text('NEXT'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),


        ],
      )
    );
  }
}

