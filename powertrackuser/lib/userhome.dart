import 'package:flutter/material.dart';
// Assuming you have UserDataPage implemented
import 'package:powertrackuser/userdatapage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final userss = Supabase.instance.client.from('users').select();

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: SafeArea(
              child: Image.asset(
                'lib/assets/longlogo.png',
                width: 200,
                height: 100,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Account Number',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Hardcoded to show one item
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to UserDataPage directly
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDataPage(
                          customerNumber: '123456',
                          customerName: 'John Doe',
                          KWHused: '500',
                          address: '123 Main Street',
                          amount: '1500',
                          generation: '500',
                          transmissionEnergy: '200',
                          systemLoss: '100',
                          distribution: '300',
                          retail: '50',
                          metering: '20',
                          meterCustomer: '10',
                          lifeline: '5',
                          realPropertyTaxSrCtzenSubsidy: '0',
                          realPropertyTax: '15',
                          localTax: '10',
                          evatGeneration: '25',
                          evatTransmission: '15',
                          evatSystemLossGeneration: '10',
                          evatSystemLossTransmission: '5',
                          evatDistribution: '20',
                          ucMissionary: '30',
                          ucEnvironment: '10',
                          ucSd: '5',
                          ucMeRed: '0',
                          fitall: '50',
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Proceed',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Image.asset(
          'lib/assets/bg.png',
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
      ),
    );
  }
}
