import 'package:flutter/material.dart';
import 'package:powertrackuser/monthlyused.dart';
import 'package:powertrackuser/userhome.dart';

class UserDataPage extends StatefulWidget {
  final String customerNumber;
  final String customerName;
  final String KWHused;
  final String address;
  final String amount;
  final String generation;
  final String transmissionEnergy;
  final String systemLoss;
  final String distribution;
  final String retail;
  final String metering;
  final String meterCustomer;
  final String lifeline;
  final String realPropertyTaxSrCtzenSubsidy;
  final String realPropertyTax;
  final String localTax;
  final String evatGeneration;
  final String evatTransmission;
  final String evatSystemLossGeneration;
  final String evatSystemLossTransmission;
  final String evatDistribution;
  final String ucMissionary;
  final String ucEnvironment;
  final String ucSd;
  final String ucMeRed;
  final String fitall;

  const UserDataPage({
    Key? key,
    required this.customerNumber,
    required this.customerName,
    required this.KWHused,
    required this.address,
    required this.amount,
    required this.generation,
    required this.transmissionEnergy,
    required this.systemLoss,
    required this.distribution,
    required this.retail,
    required this.metering,
    required this.meterCustomer,
    required this.lifeline,
    required this.realPropertyTaxSrCtzenSubsidy,
    required this.realPropertyTax,
    required this.localTax,
    required this.evatGeneration,
    required this.evatTransmission,
    required this.evatSystemLossGeneration,
    required this.evatSystemLossTransmission,
    required this.evatDistribution,
    required this.ucMissionary,
    required this.ucEnvironment,
    required this.ucSd,
    required this.ucMeRed,
    required this.fitall,
  }) : super(key: key);

  @override
  _UserDataPageState createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  int _selectedIndex = 0;
  bool _isLoading = false;

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
      body: Center(
        child: _buildPage(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('${widget.customerName}'),
              accountEmail: Text('${widget.address}'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/mainlogo2.jpg'),
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
              leading: Icon(Icons.dashboard),
            ),
            ListTile(
              title: Text('Monthly Consumption'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
              leading: Icon(Icons.analytics),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Perform logout action here
                // For example, you can clear the user data and navigate to the login page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Monthly Consumption',
          ),
        ],
      ),
    );
  }

  Future<void> _handleRefresh() async {
  // Reset state to initial values
  setState(() {
    _isLoading = true;
    // Reset any other state variables as needed
  });

  // Simulate a delay to demonstrate loading indicator
  await Future.delayed(Duration(seconds: 2));

  // Add your refresh logic here
  // For example, you can fetch updated data from the server

  // Update data here
  setState(() {
    _isLoading = false;
    // Update data here
  });
}

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _buildHomePage();
      case 1:
        return Monthly(customerNumber: '${widget.customerNumber}', customerName: '${widget.customerName}', kwhUsed: '${widget.KWHused}',);
      default:
        return _buildHomePage();
    }
  }

 Widget _buildHomePage() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (_isLoading) CircularProgressIndicator(),
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 500,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Account Number: ${widget.customerNumber}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.KWHused}',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 40,
                      padding: EdgeInsets.all(0),
                      color: Colors.orange,
                      child: Center(
                        child: Transform.rotate(
                          angle: 90 * 3.14 / 180,
                          child: Text(
                            'KW/H',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
              Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
          ],
        ),
        width: 500,
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Amount: '),
                    Text('₱ ${widget.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
              ),
              Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Icon(
        Icons.payment_sharp, // Replace with the desired icon
        color: Colors.white, // Change icon color to white
        size: 30, // Adjust icon size as needed
      ),
    ),
  ),
),

            ],
          )
          ),
      ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Generation and Transmission',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),),
              ),
              _buildSection(
                title: 'Generation',
                value: '${widget.generation}',
                color: Colors.blueAccent,
              ),
              _buildSection(
                title: 'Transmission Energy',
                value: '${widget.transmissionEnergy}',
                color: Colors.purpleAccent,
              ),
              _buildSection(
                title: 'System Loss',
                value: '${widget.systemLoss}',
                color: Colors.redAccent,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Distribution',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),),
              ),
              _buildSection(
                title: 'Distribution',
                value: '${widget.generation}',
                color: Colors.greenAccent,
              ),
              _buildSection(
                title: 'Retail',
                value: '${widget.retail}',
                color: Colors.indigoAccent,
              ),
              _buildSection(
                title: 'Metering',
                value: '${widget.metering}',
                color: Colors.pinkAccent,
              ),
              _buildSection(
                title: 'Meter Customer',
                value: '${widget.meterCustomer}',
                color: Colors.deepOrangeAccent,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Others',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),),
              ),
              _buildSection(
                title: 'Lifeline',
                value: '${widget.lifeline}',
                color: Colors.redAccent,
              ),
              _buildSection(
                title: 'Real Property Tax',
                value: '${widget.realPropertyTax}',
                color: Colors.deepPurple,
              ),
              _buildSection(
                title: 'SEnior Citizen Subsidy',
                value: '${widget.realPropertyTaxSrCtzenSubsidy}',
                color: Colors.lightBlueAccent,
              ),
              _buildSection(
                title: 'Local Tax',
                value: '${widget.localTax}',
                color: Colors.greenAccent,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Government Reveneus',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),),
              ),
              _buildSection(
                title: 'Evat-generation',
                value: '${widget.evatGeneration}',
                color: Colors.orangeAccent,
              ),
              _buildSection(
                title: 'Evat-trans',
                value: '${widget.evatTransmission}',
                color: Colors.green,
              ),
              _buildSection(
                title: 'Evat-SL Generation',
                value: '${widget.evatSystemLossGeneration}',
                color: Colors.lightBlueAccent,
              ),
              _buildSection(
                title: 'Evat-SL Transmission',
                value: '${widget.evatSystemLossTransmission}',
                color: Colors.greenAccent,
              ),
              _buildSection(
                title: 'Evat-Distribution',
                value: '${widget.evatDistribution}',
                color: Colors.purpleAccent,
              ),
              _buildSection(
                title: 'UC-Missionary',
                value: '${widget.ucMissionary}',
                color: Colors.orangeAccent,
              ),
              _buildSection(
                title: 'UC-Environment',
                value: '${widget.ucEnvironment}',
                color: Colors.red,
              ),
              _buildSection(
                title: 'UC-SD',
                value: '${widget.ucSd}',
                color: Colors.blue,
              ),
              _buildSection(
                title: 'UC-ME-R.E.D',
                value: '${widget.ucMeRed}',
                color: Colors.purple,
              ),
              _buildSection(
                title: 'FITALL RENEWABLE',
                value: '${widget.fitall}',
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildSection({
  required String title,
  required String value,
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 600, // Adjust width as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  title.substring(0, 2),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


}

