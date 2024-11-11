import 'package:flutter/material.dart';
import '../models/patient_model.dart';
import '../services/db_service.dart';

class PatientScreen extends StatelessWidget {
  final _dbService = DBService();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _medicalHistoryController = TextEditingController();

  void _registerPatient() {
    final patient = Patient(
      id: DateTime.now().toString(),
      name: _nameController.text,
      contact: _contactController.text,
      medicalHistory: _medicalHistoryController.text,
    );
    _dbService.addPatient(patient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Patient')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _contactController, decoration: InputDecoration(labelText: 'Contact')),
            TextField(controller: _medicalHistoryController, decoration: InputDecoration(labelText: 'Medical History')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _registerPatient, child: Text('Register Patient')),
          ],
        ),
      ),
    );
  }
}
