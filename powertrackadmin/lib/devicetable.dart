import 'package:flutter/material.dart';

class DevTb extends StatefulWidget {
  const DevTb({Key? key}) : super(key: key);

  @override
  State<DevTb> createState() => _DevTbState();
}

class _DevTbState extends State<DevTb> {
  final List<Map<String, dynamic>> _devices = [
    {
      'id': '001',
      'created_at': '2025-05-01 10:00:00',
    },
    {
      'id': '002',
      'created_at': '2025-05-01 11:00:00',
    },
    {
      'id': '003',
      'created_at': '2025-05-01 12:00:00',
    },
    {
      'id': '004',
      'created_at': '2025-05-01 13:00:00',
    },
  ];

  String _searchQuery = '';
  final TextEditingController _deviceNumberController = TextEditingController();

  void _insertDevice() {
    final deviceNumber = _deviceNumberController.text.trim();

    if (deviceNumber.isEmpty || int.tryParse(deviceNumber) == null) {
      _showSnackBar(context, 'Invalid device number. Please enter a valid numeric value.');
      return;
    }

    setState(() {
      _devices.add({
        'id': deviceNumber,
        'created_at': DateTime.now().toString(),
      });
    });

    _showSnackBar(context, 'Device Registered successfully!');
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> searchResults = _devices.where((device) {
      final deviceNumber = device['id'].toString().toLowerCase();
      final dateRegistered = device['created_at'].toString().toLowerCase();
      final queryLower = _searchQuery.toLowerCase();

      return deviceNumber.contains(queryLower) || dateRegistered.contains(queryLower);
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _deviceNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  labelText: 'Search Device',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text('Device Number'),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text('Date Registered'),
                    ),
                  ),
                ],
                rows: searchResults.map<DataRow>((device) {
                  return DataRow(cells: <DataCell>[
                    DataCell(Text(device['id'].toString())),
                    DataCell(Text(device['created_at'].toString())),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Register Device'),
                content: TextField(
                  controller: _deviceNumberController,
                  decoration: InputDecoration(labelText: 'Device Number'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _insertDevice();
                      Navigator.of(context).pop();
                    },
                    child: Text('Register', style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
