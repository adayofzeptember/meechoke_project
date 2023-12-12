import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Profile/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu_Allies extends StatefulWidget {
  const MainMenu_Allies({super.key});

  @override
  State<MainMenu_Allies> createState() => _MainMenu_AlliesState();
}

class _MainMenu_AlliesState extends State<MainMenu_Allies> {
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
            icon: const CircleAvatar(
              backgroundColor: Palette.thisBlue,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: const Text(
          'พันธมิตรรถร่วม',
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
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //       duration: const Duration(milliseconds: 500),
                  //       type: PageTransitionType.fade,
                  //       child: Job_Lists()),
                  // );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    child: SvgPicture.asset(
                      'assets/images/main_menu/car_power_report.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //       duration: const Duration(milliseconds: 500),
                  //       type: PageTransitionType.fade,
                  //       child: Job_Lists()),
                  // );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    child: SvgPicture.asset(
                      'assets/images/main_menu/getwork.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //       duration: const Duration(milliseconds: 500),
                  //       type: PageTransitionType.fade,
                  //       child: Job_Lists()),
                  //);
                },
               
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    child: SvgPicture.asset(
                      'assets/images/main_menu/paperwork.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
Future showProfile(var context) async {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (context) {
        return BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.loading == true) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            } else {
              return AlertDialog(
                content: Stack(
                  children: [
                    Positioned(
                        top: -5,
                        left: 230,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.close))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(),
                            //     Text(
                            //       "พขร. ID: ${state.profile_data.id}",
                            //       style: TextStyle(
                            //           fontSize: 20,
                            
                            //           fontWeight: FontWeight.bold,
                            //           color: Palette.thisBlue),
                            //     ),
                            //   ],
                            // ),
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
                                  state.profile_data.name.toString(),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'ทะเบียนลูก',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 131, 131, 131),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 234, 127),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(

                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 255, 234, 127),
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 8, 15, 8),
                                            child: 
                                            Column(
                                              children: [
                                                const Text(
                                                  '899599',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text('นครราชสีมา'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'ทะเบียนลูก',
                                      style: TextStyle(
                                                                    color: Color.fromARGB(255, 131, 131, 131),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration:   BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 234, 127),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding:  EdgeInsets.all(5.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:  Color.fromARGB(
                                                  255, 255, 234, 127),
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 8, 15, 8),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '899599',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                             Text('นครราชสีมา'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
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
                        // SharedPreferences prefrences =
                        //     await SharedPreferences.getInstance();
                        // prefrences.clear();
                        // Phoenix.rebirth(context);
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
            }
          },
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
                //!context.read<LoginBloc>().add(Logout_Auth(context: context));
                SharedPreferences prefrences =
                    await SharedPreferences.getInstance();
                prefrences.clear();
                Phoenix.rebirth(context);
              },
            ),
          ],
        );
      },
    );
  }
} 