import 'package:flutter/material.dart';
import 'package:meechoke_project/seven%20main%20function%20pages/gas/gas_form.dart';
import 'package:page_transition/page_transition.dart';

class GasFuel_Info extends StatefulWidget {
  const GasFuel_Info({super.key});

  @override
  State<GasFuel_Info> createState() => _GasFuel_InfoState();
}

class _GasFuel_InfoState extends State<GasFuel_Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.call_outlined,
              color: Colors.white,
            ),
          ),
        ],
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
          'เติมน้ำมัน',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 119, 169, 226),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No. JO99/98958',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 33, 107, 243),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        ' ยังไม่ได้เติม ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Divider(
                                    thickness: 1,
                                    color: Color.fromARGB(255, 212, 212, 212)),
                              ),
                              Text('เลขที่ใบสั่งเติม : 185',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 84, 137, 236),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('สถานที่เติม',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 63, 202, 212),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.pin_drop,
                          size: 50,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'ไม่ระบุ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              'โชคชัย นครราชสีมา',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'เลขที่ใบสั่งเติม : ',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'สถานที่เติม :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'เชื้อเพลิงสั่งเติม :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'ปริมาณสั่งเติม (ลิตร/กก.) :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'จำนวนเงิน :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Job ID :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '*หมายเหตุ : ',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '185FS180',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'ไม่ระบุ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'NGV',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '196.6',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '3,156.90 บาท',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'JO 88/8989',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      ' ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 235, 88, 62),
                        elevation: 0,
                        // side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.fade,
                            child: Gas_Form()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          "เติมน้ำมัน",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
