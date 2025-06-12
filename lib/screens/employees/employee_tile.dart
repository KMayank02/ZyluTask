import 'package:flutter/material.dart';
import 'package:zylutask/models/employee.dart';
import 'package:zylutask/utils/colors.dart';
import 'package:zylutask/utils/size_config.dart';

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({super.key, required this.employee});

  final Employee employee;

  int getAge() {
    try {
      final birthDate = DateTime.parse(employee.dob);
      final today = DateTime.now();
      int age = today.year - birthDate.year;
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      return 0;
    }
  }

  int getYearsActive() {
    try {
      final hireDate = DateTime.parse(employee.hire);
      final exitDate =
          employee.exit == "" ? DateTime.now() : DateTime.parse(employee.exit);
      int yearsActive = exitDate.year - hireDate.year;
      if (exitDate.month < hireDate.month ||
          (exitDate.month == hireDate.month && exitDate.day < hireDate.day)) {
        yearsActive--;
      }
      return yearsActive;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: employee.exit=="" && getYearsActive()>5?kActiveColor: kSecondaryColor,
            child: Text(
              employee.name[0].toUpperCase(),
              style: TextStyle(
                  color: kTextColor, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          horizontalSpaceDefault,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Name : ',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        employee.name,
                        style: TextStyle(
                            color: kTextColor, fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Dept : ',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        employee.dept,
                        style: TextStyle(
                            color: kTextColor, fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Age : ',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        getAge().toString(),
                        style: TextStyle(
                            color: kTextColor, fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Years Employed : ',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        getYearsActive().toString(),
                        style: TextStyle(
                            color: kTextColor, fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Status : ',
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        employee.exit == "" ? 'Active' : 'Inactive',
                        style: TextStyle(
                            color: kTextColor, fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
