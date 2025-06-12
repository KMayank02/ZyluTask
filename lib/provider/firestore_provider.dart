import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zylutask/models/employee.dart';

class EmployeeProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;

  List<Employee> _totalEmployees = [];

  bool _isLoading = true;

  void emptyEmployees() {
    _totalEmployees.clear();
    notifyListeners();
  }

  List<Employee> get employees => _totalEmployees;

  bool get isLoading => _isLoading;

  Future<List<Employee>> fetchEmployees() async {
    _isLoading = true;
    notifyListeners();
    try {
      final snapshot = await _firestore.collection('employees').get();
      _totalEmployees =
          snapshot.docs.map((doc) => Employee.fromJson(doc.data())).toList();
    } catch (e) {
      print("Error fetching employees from Firestore: $e");
      _totalEmployees = [];
    }
    _isLoading = false;
    notifyListeners();
    return _totalEmployees;
  }
}
