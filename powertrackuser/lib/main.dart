import 'package:flutter/material.dart';
import 'package:powertrackuser/userhome.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://hpkdefuqabnybzcivcck.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhwa2RlZnVxYWJueWJ6Y2l2Y2NrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE2ODMwNzMsImV4cCI6MjAyNzI1OTA3M30.AThwIJ-z9iIw013S2VluJQORih-x6rMs2TISVnW1cms',
    );
  
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(brightness: Brightness.light, 
        primary: Colors.green,
        onPrimary: Colors.black, 
        secondary: Colors.green, 
        onSecondary: Colors.white, 
        error: Colors.grey, 
        onError: Colors.grey, 
        background: Colors.tealAccent, 
        onBackground: Colors.grey, 
        surface: Colors.grey, 
        onSurface: Colors.grey)
      ),
      home: Home(),
    );
  }
}

