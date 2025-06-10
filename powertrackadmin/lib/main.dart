import 'package:electricbill/adminlog.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'AdminProvider.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://hpkdefuqabnybzcivcck.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhwa2RlZnVxYWJueWJ6Y2l2Y2NrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE2ODMwNzMsImV4cCI6MjAyNzI1OTA3M30.AThwIJ-z9iIw013S2VluJQORih-x6rMs2TISVnW1cms',
    );
  
  runApp(ChangeNotifierProvider(
      create: (_) => AdminProvider(),
      child: MyApp(),
    ),);
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Admin(),
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
    );
  }
}

