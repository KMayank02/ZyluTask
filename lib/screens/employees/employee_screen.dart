import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zylutask/screens/employees/employee_body.dart';
import 'package:zylutask/utils/colors.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: kPrimaryColor,
      ),
      child: Scaffold(
        backgroundColor: kBgColor,
        body: EmployeeListBody(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
