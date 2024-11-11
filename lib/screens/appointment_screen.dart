import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic for scheduling an appointment can be implemented here.
          },
          child: Text('Schedule Appointment'),
        ),
      ),
    );
  }
}
