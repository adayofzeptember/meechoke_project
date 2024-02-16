import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/Jobs/tab_mainScreen.dart';

class MenuTable extends StatefulWidget {
  const MenuTable({super.key});

  @override
  State<MenuTable> createState() => _MenuTableState();
}

class _MenuTableState extends State<MenuTable> {
  @override
  Widget build(BuildContext context) {
    //*
    var size = MediaQuery.of(context).size;
    final double h1 = (size.height - kToolbarHeight - 400) / 2;
    final double w1 = size.width / 2;
    final double h = (size.height - kToolbarHeight - 300) / 2;
    final double w = size.width / 2;
    //*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 83, 145, 216),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Meechoke Driver Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 119, 169, 226),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.rightToLeft,
                        child: Job_Lists()),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.task,
                        size: 80,
                        color: Colors.teal,
                      ),
                      Text(
                        "งาน",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              GridView.count(
                primary: false,
                childAspectRatio: (w1 / h1),
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.rightToLeft,
                            child: Job_Lists()),
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.all(8),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.task,
                            size: 80,
                            color: Colors.teal,
                          ),
                          Text(
                            "งาน",
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.all(8),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 80,
                            color: Colors.teal,
                          ),
                          Text(
                            "แผนงาน",
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                primary: false,
                childAspectRatio: (w / h),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ))),
                          onPressed: () {},
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.list_alt,
                                size: 60,
                                color: Colors.teal,
                              ),
                              Text(
                                "ประวัติงาน",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings,
                                size: 60,
                                color: Colors.white,
                              ),
                              Text(
                                "แจ้งซ่อม",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.gas_meter,
                            size: 80,
                            color: Colors.teal,
                          ),
                          Text(
                            "เติมน้ำมัน",
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                primary: false,
                childAspectRatio: (w / h),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.car_repair,
                            size: 80,
                            color: Colors.teal,
                          ),
                          Column(
                            children: [
                              Text(
                                "ตรวจเช็ครถ",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "ประจำวัน",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 230, 93, 84),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning_amber,
                                size: 60,
                                color: Colors.white,
                              ),
                              Text(
                                "แจ้งเหตุ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                size: 60,
                                color: Colors.teal,
                              ),
                              Text(
                                "ออกจากระบบ",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
