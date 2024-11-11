import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/insurance_model.dart';

class InsuranceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> applyForInsurance(Insurance insurance) async {
    await _firestore.collection('insurance_applications').doc(insurance.id).set(insurance.toJson());
  }

  Future<List<Insurance>> getUserInsuranceApplications(String userId) async {
    QuerySnapshot snapshot = await _firestore.collection('insurance_applications')
        .where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => Insurance.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }
}
