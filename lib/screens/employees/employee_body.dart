import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zylutask/provider/firestore_provider.dart';
import 'package:zylutask/screens/employees/employee_tile.dart';
import 'package:zylutask/utils/colors.dart';
import 'package:zylutask/utils/size_config.dart';

class EmployeeListBody extends StatefulWidget {
  const EmployeeListBody({super.key});

  @override
  State<EmployeeListBody> createState() => _EmployeeListBodyState();
}

class _EmployeeListBodyState extends State<EmployeeListBody> {
  late EmployeeProvider employeeProvider;
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);
      employeeProvider.fetchEmployees();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<EmployeeProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(color: kPrimaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Employees',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      verticalSpaceDefault,
                      verticalSpaceDefault,
                      isLoading || value.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ))
                          : Container(
                              width: SizeConfig.screenWidth,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: ListView.builder(
                                itemCount: value.employees.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      EmployeeTile(
                                        employee: value.employees[index],
                                      ),
                                      verticalSpaceSmall,
                                    ],
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
