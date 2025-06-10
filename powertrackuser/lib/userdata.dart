import 'package:flutter/material.dart';
import 'package:powertrackuser/userdatapage.dart'; // Import the UserDataPage widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PowerTrack User App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(), // Set MainPage as the home page
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the UserDataPage when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserDataPage(
                // Pass sample data to the UserDataPage widget
                customerNumber: '123456',
                customerName: 'John Doe',
                KWHused: '500',
                address: '123 Main Street',
                amount: '100.00',
                generation: '...',
                transmissionEnergy: '...',
                systemLoss: '...',
                distribution: '...',
                retail: '...',
                metering: '...',
                meterCustomer: '...',
                lifeline: '...',
                realPropertyTaxSrCtzenSubsidy: '...',
                localTax: '...',
                evatGeneration: '...',
                evatTransmission: '...',
                evatSystemLossGeneration: '...',
                evatSystemLossTransmission: '...',
                evatDistribution: '...',
                ucMissionary: '...',
                ucEnvironment: '...',
                ucSd: '...',
                ucMeRed: '...',
                fitall: '...',
              )),
            );
          },
          child: Text('Go to UserDataPage'),
        ),
      ),
    );
  }
}
