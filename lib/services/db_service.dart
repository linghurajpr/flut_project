import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/patient_model.dart';

class DBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPatient(Patient patient) async {
    await _firestore.collection('patients').doc(patient.id).set(patient.toJson());
  }

  Future<List<Patient>> getPatients() async {
    QuerySnapshot snapshot = await _firestore.collection('patients').get();
    return snapshot.docs.map((doc) => Patient.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }
}
