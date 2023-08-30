import 'package:flutter/material.dart';
import 'package:meechoke_project/screens/main_menu_screen.dart';
import 'package:page_transition/page_transition.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final formKey_LogIn = GlobalKey<FormState>();
  String userName = '';
  String passWord = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MEECHOKE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Logistic management System',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: formKey_LogIn,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        //  initialValue: 'watermeter13',
                        textAlign: TextAlign.left,
                        autofocus: false,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        onSaved: (input) => userName = input.toString(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'โปรดกรอกชื่อบัญชี';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'กรอกบัญชีผู้ใช้',
                          labelStyle: const TextStyle(fontSize: 15),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 238, 238, 238),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // initialValue: 'password',
                        obscureText: true,
                        textAlign: TextAlign.left,
                        autofocus: false,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        onSaved: (input) => passWord = input.toString(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'โปรดกรอกรหัสผ่าน';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'กรอกรหัสผ่าน',
                          labelStyle: const TextStyle(fontSize: 15),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 238, 238, 238),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 60,
                        child: 
                        
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 235, 88, 62),
                              elevation: 0,
                              // side: BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                          onPressed: () {
                            print('object');
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 820),
                                  type: PageTransitionType.fade,
                                  child: Main_Menu_Page()),
                            );
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
