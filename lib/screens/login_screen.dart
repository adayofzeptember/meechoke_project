import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/ProgressHUD.dart';
import 'package:meechoke_project/bloc/login/login_bloc.dart';
import 'package:meechoke_project/screens/Allience%20%E0%B8%9E%E0%B8%B1%E0%B8%99%E0%B8%98%E0%B8%A1%E0%B8%B4%E0%B8%95%E0%B8%A3%E0%B8%A3%E0%B8%96%E0%B8%A3%E0%B9%88%E0%B8%A7%E0%B8%A1%20/menu_screen_allience.dart';
import 'package:page_transition/page_transition.dart';
import '../ETC/app_color.dart';

var usernameController = TextEditingController();
var passwordController = TextEditingController();

class Login_Screen extends StatelessWidget {
  Login_Screen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiLogin(context), inAsyncCall: state.loading, opacity: 0.3);
      },
    );
  }

  Widget _uiLogin(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Palette.thisBlue,
            body: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Column(children: [
              const SizedBox(
                height: 90,
              ),
              const Text(
                'Meechoke',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 80,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1,
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: const Text(
                                    'เข้าสู่ระบบ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Palette.thisBlue),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'ชื่อผู้ใช้',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: usernameController,
                                  textAlign: TextAlign.left,
                                  autofocus: false,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'โปรดกรอกชื่อบัญชี';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'กรอกชื่อผู้ใช้',
                                      labelStyle: const TextStyle(fontSize: 15),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 211, 211, 211)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 211, 211, 211)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 211, 211, 211)),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'รหัสผ่าน',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: state.obscurePass,
                                  textAlign: TextAlign.left,
                                  autofocus: false,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'โปรดกรอกรหัสผ่าน';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          context
                                              .read<LoginBloc>()
                                              .add(ShowPassword_Swap());
                                        },
                                        icon: Icon(Icons.remove_red_eye,
                                            color: (state.obscurePass == true)
                                                ? Color.fromARGB(
                                                    255, 211, 211, 211)
                                                : Palette.thisBlue),
                                      ),
                                      hintText: 'กรอกรหัสผ่าน',
                                      labelStyle: const TextStyle(fontSize: 15),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 211, 211, 211)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 211, 211, 211)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 211, 211, 211)),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //                            Icon(
                                    //   isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                                    //   color: Colors.blue,
                                    // ),
                                    // setState(() {
                                    //   isChecked = !isChecked;
                                    // });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        color: Palette.thisBlue,
                                      ),
                                      SizedBox(width: 5),
                                      Text('จำรหัสผ่าน'),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Palette.thisBlue,
                                        elevation: 0,
                                        // side: BorderSide(color: Colors.white),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    onPressed: () {
                                      // if (_formKey.currentState!.validate()) {
                                      //   // // If the form is valid, display a snackbar or perform any action
                                      //   // ScaffoldMessenger.of(context)
                                      //   //     .showSnackBar(
                                      //   //   SnackBar(content: Text('กรอกข้อมูลให้ถูกต้อง')),
                                      //   // );
                                      // }

                                      context.read<LoginBloc>().add(
                                          Login_Casual(
                                              context: context,
                                              getUsername:
                                                  usernameController.text,
                                              getPassword:
                                                  passwordController.text));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "เข้าสู่ระบบ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Palette.thisBlue,
                                        elevation: 0,
                                        // side: BorderSide(color: Colors.white),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            type: PageTransitionType.fade,
                                            child: MainMenu_Allience()),
                                      );
                                      // if (_formKey.currentState!.validate()) {
                                      //   // // If the form is valid, display a snackbar or perform any action
                                      //   // ScaffoldMessenger.of(context)
                                      //   //     .showSnackBar(
                                      //   //   SnackBar(content: Text('กรอกข้อมูลให้ถูกต้อง')),
                                      //   // );
                                      // }

                                      // context.read<LoginBloc>().add(
                                      //     Login_Casual(
                                      //         context: context,
                                      //         getUsername:
                                      //             usernameController.text,
                                      //         getPassword:
                                      //             passwordController.text));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "เข้าสู่ระบบ (พันธมิตรรถร่วม)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ])));
      },
    );
  }
}

//*clersr

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Selectable ElevatedButtons')),
        body: ButtonSelection(),
      ),
    );
  }
}

class ButtonSelection extends StatefulWidget {
  @override
  _ButtonSelectionState createState() => _ButtonSelectionState();
}

class _ButtonSelectionState extends State<ButtonSelection> {
  int? _selectedButtonIndex;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: _selectedButtonIndex == 0 ? Colors.blue : Colors.grey,
              ),
              onPressed: () => _onButtonPressed(0),
              child: Text('Button 1'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: _selectedButtonIndex == 1 ? Colors.blue : Colors.grey,
              ),
              onPressed: () => _onButtonPressed(1),
              child: Text('Button 2'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: _selectedButtonIndex == 2 ? Colors.blue : Colors.grey,
              ),
              onPressed: () => _onButtonPressed(2),
              child: Text('Button 3'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: _selectedButtonIndex == 3 ? Colors.blue : Colors.grey,
              ),
              onPressed: () => _onButtonPressed(3),
              child: Text('Button 4'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: _selectedButtonIndex == 4 ? Colors.blue : Colors.grey,
              ),
              onPressed: () => _onButtonPressed(4),
              child: Text('Button 5'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: _selectedButtonIndex == 5 ? Colors.blue : Colors.grey,
              ),
              onPressed: () => _onButtonPressed(5),
              child: Text('Button 6'),
            ),
          ),
        ],
      ),
    );
  }
}
