import 'package:flutter/material.dart';

class PriceTb extends StatelessWidget {
  final List<Map<String, dynamic>> _pricing = [
    {
      'generation': '5.50',
      'transmission_energy': '2.30',
      'system_loss': '1.20',
      'distribution': '3.00',
      'retail': '0.50',
      'metering': '0.80',
      'meter_customer': '0.40',
      'lifeline': '0.30',
      'real_property_tax_sr_ctzen_subsidy': '0.10',
      'local_tax': '0.20',
      'evat_generation': '0.60',
      'evat_transmission': '0.40',
      'evat_system_loss_generation': '0.15',
      'evat_system_loss_transmission': '0.10',
      'evat_distribution': '0.25',
      'uc_missionary': '0.50',
      'uc_environment': '0.10',
      'uc_sd': '0.05',
      'uc_me_red': '0.20',
      'fitall': '0.30',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final price = _pricing[0]; // Since we have only one pricing object
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of cards per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: price.entries.map((entry) {
            return _buildCard(entry.key, entry.value, _getColor(entry.key));
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.replaceAll('_', ' ').toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '₱ $value',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(String key) {
    // Assign colors based on the key
    if (key.contains('generation')) return Colors.blue;
    if (key.contains('transmission')) return Colors.green;
    if (key.contains('system_loss')) return Colors.orange;
    if (key.contains('distribution')) return Colors.red;
    if (key.contains('retail')) return Colors.purple;
    if (key.contains('meter')) return Colors.teal;
    if (key.contains('lifeline')) return Colors.pink;
    if (key.contains('tax')) return Colors.brown;
    if (key.contains('uc')) return Colors.cyan;
    return Colors.grey;
  }
}
