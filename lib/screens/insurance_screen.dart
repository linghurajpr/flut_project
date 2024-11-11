import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../services/insurance_service.dart';
import '../models/insurance_model.dart';

class InsuranceScreen extends StatefulWidget {
  @override
  _InsuranceScreenState createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  final InsuranceService _insuranceService = InsuranceService();
  final TextEditingController _detailsController = TextEditingController();
  List<Insurance> _applications = [];

  @override
  void initState() {
    super.initState();
    _fetchApplications();
  }

  Future<void> _fetchApplications() async {
    // Normally retrieve userId from logged-in user data
    final userId = 'sampleUserId';
    final applications = await _insuranceService.getUserInsuranceApplications(userId);
    setState(() {
      _applications = applications;
    });
  }

  void _applyForInsurance() async {
    final userId = 'sampleUserId';  // Replace with actual user ID
    final newInsurance = Insurance(
      id: Uuid().v4(),
      userId: userId,
      details: _detailsController.text,
      status: 'Pending',
      documentUrl: '', // Add document URL handling if needed
    );

    await _insuranceService.applyForInsurance(newInsurance);
    _detailsController.clear();
    _fetchApplications();  // Refresh applications list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apply for Insurance')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Insurance Details'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _applyForInsurance,
              child: Text('Apply Insurance'),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _applications.length,
                itemBuilder: (context, index) {
                  final insurance = _applications[index];
                  return ListTile(
                    title: Text(insurance.details),
                    subtitle: Text('Status: ${insurance.status}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
