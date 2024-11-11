import 'package:flutter/material.dart';
import 'insurance_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Hospital Management System!'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsuranceScreen()),
                );
              },
              child: Text('Apply for Insurance'),
            ),
          ],
        ),
      ),
    );
  }
}
