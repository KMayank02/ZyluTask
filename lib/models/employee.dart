import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  String name;
  String dob;
  String hire;
  String exit;
  String dept;

  Employee({
    required this.name,
    required this.dob,
    required this.hire,
    required this.exit,
    required this.dept,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        name: json["Name"],
        dob: json["DOB"],
        hire: json["Hire Date"],
        exit: json["Exit Date"],
        dept: json["Department"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dob": dob,
        "hire": hire,
        "exit": exit,
        "dept": dept,
      };
}
