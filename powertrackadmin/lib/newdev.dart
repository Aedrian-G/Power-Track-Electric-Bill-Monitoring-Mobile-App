import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class newdev extends StatefulWidget {
  @override
  _newdevState createState() => _newdevState();
}

class _newdevState extends State<newdev> {
  final TextEditingController _deviceNumberController = TextEditingController();
  final DateTime _currentDate = DateTime.now();

  Future<void> _insertDevice() async {
  final supabase = Supabase.instance.client;
  final deviceNumber = _deviceNumberController.text.trim();

  final response = await supabase.from('devices').insert({
    'device_number': deviceNumber,
    'date_registered': _currentDate.toUtc().toIso8601String(), // Convert DateTime to ISO 8601 string
  });

  if (response?.error != null) {
    print('Error inserting data: ${response.error}');
  } else {
    print('Data inserted successfully!');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Supabase Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _deviceNumberController,
              decoration: InputDecoration(labelText: 'Device Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _insertDevice,
              child: Text('Insert Data'),
            ),
          ],
        ),
      ),
    );
  }
}
