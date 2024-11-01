import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meechoke_project/bloc/Employee%20Monthly/employee_check_monthly_bloc.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';
import 'package:meechoke_project/screens/Jobs/1.%20Main%20Pages%20List/tab_main.dart';
import 'package:page_transition/page_transition.dart';

Future<void> SuccessMessage_Dialog(
    BuildContext context, String message, String check) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true, //! <-- Set it to true
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/circle-check.svg'),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 107, 201, 110),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ));
      });

  Future.delayed(const Duration(seconds: 1), () {
    if (check == 'ส่งแจ้ง') {
      Navigator.of(context).pop();
      // Navigator.of(context).pop();
    } else if (check == 'เชื้อเพลิง') {
      context.read<FuelBloc>().add(Load_FuelNotYet());
      context.read<FuelBloc>().add(Load_Filled());
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } else if (check == 'เช็ครถ') {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } else if (check == 'เช็ครถ2') {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      context.read<EmployeeCheckMonthlyBloc>().add(Load_All_MonthList());
      context.read<EmployeeCheckMonthlyBloc>().add(Load_Done_MonthList());
    } else {
      context.read<JobsBloc>().add(Load_NewJobs(context: context));
      context.read<JobsBloc>().add(Load_CurrentJobs());
      Navigator.pushReplacement(
        context,
        PageTransition(
            duration: const Duration(milliseconds: 500),
            type: PageTransitionType.fade,
            child: Job_Lists(
              toCheck: 1,
            )),
      );
    }
  });
}
