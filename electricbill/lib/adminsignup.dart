import 'package:electricbill/AdminProvider.dart';
import 'package:electricbill/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminSignUp extends StatefulWidget {
  @override
  _AdminSignUpState createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  User? _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Center(
    child: Container(
      padding: EdgeInsets.all(10.0),
      child: Image.asset(
        'lib/assets/mainlogo.png',
      ),
    ),
  ),
),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email'),
            TextField(
              controller: _emailController,
            ),
            SizedBox(height: 16.0),
            Text('Password'),
            TextField(
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;

                try {
                  final response = await supabase.auth.signUp(
                    email: email,
                    password: password,
                  );

                  if (response.user!= null) {
                    Provider.of<AdminProvider>(context, listen: false).setEmail(response.user!.email);

                    setState(() {
                      _user = response.user;


                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email/Password is incorrect!')),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email/Password is incorrect!')),
                  );
                }
              },
              child: Text('Sign in'),
            ),
            if (_user!= null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${_user!.id}'),
                  Text('Email: ${_user!.email}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}