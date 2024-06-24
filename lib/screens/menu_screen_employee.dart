import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
import 'package:meechoke_project/bloc/Profile/profile_bloc.dart';
import 'package:meechoke_project/bloc/login/login_bloc.dart';
import 'package:meechoke_project/screens/Employee/Monthly/tab.dart';
import 'package:page_transition/page_transition.dart';

class MainMenu_Employee extends StatefulWidget {
  const MainMenu_Employee({super.key});

  @override
  State<MainMenu_Employee> createState() => _MainMenu_EmployeeState();
}

class _MainMenu_EmployeeState extends State<MainMenu_Employee> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(Load_Profile());

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showProfile(context);
            },
            icon: CircleAvatar(
                backgroundColor: Palette.thisBlue,
                child: Image.asset(
                  'assets/images/oct.png',
                  color: Colors.white,
                  height: 30,
                )
                // Icon(
                //   Icons.person,
                //   color: Colors.white,
                // ),
                ),
          ),
        ],
        title: const Text(
          'ลูกจ้าง',
          style:
              TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  context.read<CarCheckBloc>().add(Empty_Check());

                  Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                        child: Check_Montly()),
                  );
                },
                child: Container(
                  child: SvgPicture.asset(
                    'assets/images/main_menu/car_check.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//*-----------------------------------------------------------------------------------------------------------
  Future showProfile(var context) async {
    return showDialog(
      context: context,
      barrierDismissible: true, //* user must tap button!
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: SingleChildScrollView(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.loading == true) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 58,
                          backgroundImage:
                              AssetImage('assets/images/person.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.profile_data.name,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 49, 48, 48),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'ทะเบียนแม่',
                            style: TextStyle(
                                color: Color.fromARGB(255, 131, 131, 131),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 234, 127),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 234, 127),
                                    border: Border.all(color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                  child: Column(
                                    children: [
                                      Text(
                                        state.profile_data.plateNumber,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(state.profile_data.province),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'ทะเบียนลูก',
                            style: TextStyle(
                                color: Color.fromARGB(255, 131, 131, 131),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 234, 127),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 234, 127),
                                    border: Border.all(color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                  child: Column(
                                    children: [
                                      Text(
                                        state.profile_data.trailerPlateNumber,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(state.profile_data.province),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 234, 240, 255),
                    elevation: 0,
                    side: const BorderSide(color: Palette.thisBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () async {
                  logoutAlert(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Palette.thisBlue,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "ออกจากระบบ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.thisBlue,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //?
  Future<void> logoutAlert(
    var context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'ต้องการออกจากระบบหรือไม่?',
            style: TextStyle(
                color: Palette.thisBlue,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor:
                    const Color.fromARGB(255, 235, 116, 108), // Splash color
              ),
              child: const Text(
                'ยกเลิก',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor:
                    const Color.fromARGB(255, 138, 206, 140), // Splash color
              ),
              child: const Text(
                'ยืนยัน',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                context.read<LoginBloc>().add(Logout_Auth(context: context));
              },
            ),
          ],
        );
      },
    );
  }
}
