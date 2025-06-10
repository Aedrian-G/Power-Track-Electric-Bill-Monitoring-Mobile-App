import 'package:flutter/material.dart';

class UserTb extends StatefulWidget {
  const UserTb({Key? key}) : super(key: key);

  @override
  State<UserTb> createState() => _UserTbState();
}

class _UserTbState extends State<UserTb> {
  final List<Map<String, dynamic>> _users = [
    {
      'customer_number': '001',
      'customer_name': 'John Doe',
      'address': '123 Main St',
      'kwh_used': '150'
    },
    {
      'customer_number': '002',
      'customer_name': 'Jane Smith',
      'address': '456 Elm St',
      'kwh_used': '200'
    },
    {
      'customer_number': '003',
      'customer_name': 'Alice Johnson',
      'address': '789 Oak St',
      'kwh_used': '180'
    },
    {
      'customer_number': '004',
      'customer_name': 'Bob Brown',
      'address': '321 Pine St',
      'kwh_used': '220'
    },
  ];

  String _searchQuery = '';

  final TextEditingController _customerNumberController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _insertUser() {
    final customerNumber = _customerNumberController.text.trim();
    final customerName = _customerNameController.text.trim();
    final address = _addressController.text.trim();

    setState(() {
      _users.add({
        'customer_number': customerNumber,
        'customer_name': customerName,
        'address': address,
        'kwh_used': '0', // Default KWH Used
      });
    });

    _showSnackBar(context, 'User Registered successfully!');
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
    final List<Map<String, dynamic>> searchResults = _users.where((user) {
      final customerNumber = user['customer_number'].toString().toLowerCase();
      final customerName = user['customer_name'].toString().toLowerCase();
      final queryLower = _searchQuery.toLowerCase();

      return customerNumber.contains(queryLower) || customerName.contains(queryLower);
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search User',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Text('Customer Number'),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Text('Customer Name'),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Text('Address'),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Text('KWH Used'),
                      ),
                    ),
                  ],
                  rows: searchResults.map<DataRow>((user) {
                    return DataRow(cells: <DataCell>[
                      DataCell(Text(user['customer_number'].toString())),
                      DataCell(Text(user['customer_name'].toString())),
                      DataCell(Text(user['address'].toString())),
                      DataCell(Text(user['kwh_used'].toString())),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Register User'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _customerNumberController,
                      decoration: InputDecoration(labelText: 'Customer Number'),
                    ),
                    TextField(
                      controller: _customerNameController,
                      decoration: InputDecoration(labelText: 'Customer Name'),
                    ),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(labelText: 'Address'),
                    ),
                  ],
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
                      _insertUser();
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
