
import 'package:flutter/material.dart';

import 'MainLayout.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final _usernameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Register",
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
          TextField(
            controller: _firstnameController,
            decoration: InputDecoration(
              filled: true, // means the background of the text is lightly filled in to help user recognize the tap/touch area of the text field
              labelText: 'First Name',
            ),
          ),
          // spacer
          SizedBox(height: 12.0),TextField(
            controller: _lastnameController,
            decoration: InputDecoration(
              filled: true, // means the background of the text is lightly filled in to help user recognize the tap/touch area of the text field
              labelText: 'Last Name',
            ),
          ),
          // spacer
          SizedBox(height: 12.0),TextField(
            controller: _imageUrlController,
            decoration: InputDecoration(
              filled: true, // means the background of the text is lightly filled in to help user recognize the tap/touch area of the text field
              labelText: 'Image URL',
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
                  _firstnameController.clear();
                  _lastnameController.clear();
                  _imageUrlController.clear();
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

