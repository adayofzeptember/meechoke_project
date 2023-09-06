import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/Jobs/job_wait_to_accept_1.dart';
import 'package:page_transition/page_transition.dart';

class Fuel_Lists extends StatefulWidget {
  @override
  _Fuel_ListsState createState() => _Fuel_ListsState();
}

class _Fuel_ListsState extends State<Fuel_Lists>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.thisBlue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.person,
                color: Palette.thisBlue,
                size: 15,
              ),
            ),
          ),
        ],
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
          'เติมเชื้อเพลิง',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 228, 237, 240),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color.fromARGB(255, 226, 62, 62),
                        Color.fromARGB(255, 219, 194, 48)
                      ]),
                      borderRadius: BorderRadius.circular(40),
                      color: Palette.thisBlue),
                  tabs: [
                    Tab(
                      text: 'ยังไม่ได้เติม',
                    ),
                    Tab(
                      text: 'เติมแล้ว',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  //! first tab bar view widget
                  haventFilled(context),

                  //! second tab bar view widget
                  Text('data')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget haventFilled(context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        
        //!
        Navigator.push(
          context,
          PageTransition(
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.fade,
              child: Job_Wait_toAccept()),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/icon_job.svg',
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 3,
                ),
                Row(
                  children: [
                    Text(
                      'วันที่สั่งเติม ',
                      style: TextStyle(),
                    ),
                    Text(
                      '10 พ.ย. 2565 08:00',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Palette.thisBlue),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'JO65/47416',
                          style: TextStyle(
                              color: Palette.thisBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 233, 196, 0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                            child: SizedBox(
                              width: 130,
                              child: Text(
                                'ยังไม่ได้เติม',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 130, child: Text('เลขที่ใบสั่งเติม :')),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '111',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 130, child: Text('สถานที่เติม :')),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '111. ไม่ระบุ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 130, child: Text('เชื้อเพลิงที่สั่งเติม :')),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'ดีเซล B20',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 130, child: Text('ปริมาณ (ลิตร/กก.) :')),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '10 ลิตร',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 130, child: Text('จำนวนเงิน (บาท) :')),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '200',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 130, child: Text('จำนวนเงิน (บาท) :')),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Text(
                            'น้ำตาลครบุรี(คร ',
                            overflow: TextOverflow.clip,
                            maxLines: 3,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 130, child: Text('จุดส่งสินค้า :')),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Text(
                            'นครราชสีมา',
                            overflow: TextOverflow.clip,
                            maxLines: 3,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    Row(
                      children: [
                        SizedBox(width: 130, child: Text('หมายเหตุ :')),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '-',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
