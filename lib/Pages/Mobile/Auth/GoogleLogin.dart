import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            print('Google Login');
          },
          icon: Icon(Icons.security),
          label: Text('GOOGLE LOGIN'),
        ),
      ),
    );
  }
}
