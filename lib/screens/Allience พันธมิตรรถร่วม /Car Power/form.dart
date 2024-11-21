import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Car_Power/car_power_bloc.dart';

class CarPower_Form extends StatefulWidget {
  @override
  _CarPower_FormState createState() => _CarPower_FormState();
}

class _CarPower_FormState extends State<CarPower_Form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: SingleChildScrollView(
        child: BlocBuilder<CarPowerBloc, CarPowerState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'เลือกกลุ่มรถ',
                  style: TextStyle(
                      color: Palette.thisBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary:
                                    state.car_group_selectedButtonIndex == 0
                                        ? Palette.thisBlue
                                        : Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Palette.thisBlue, // Border color
                                    width: 2.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                context.read<CarPowerBloc>().add(
                                    CarGroup_OnButtonPressedIndex(getIndex: 0));
                              },
                              child: Text(
                                '4 ล้อพ่วง',
                                style: TextStyle(
                                  color:
                                      state.car_group_selectedButtonIndex == 0
                                          ? Colors.white
                                          : Palette.thisBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Adjust spacing between buttons
                        Expanded(
                          child: Container(
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary:
                                    state.car_group_selectedButtonIndex == 1
                                        ? Palette.thisBlue
                                        : Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Palette.thisBlue, // Border color
                                    width: 2.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                context.read<CarPowerBloc>().add(
                                    CarGroup_OnButtonPressedIndex(getIndex: 1));
                              },
                              child: Text(
                                '6 ล้อ',
                                style: TextStyle(
                                  color:
                                      state.car_group_selectedButtonIndex == 1
                                          ? Colors.white
                                          : Palette.thisBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary:
                                    state.car_group_selectedButtonIndex == 2
                                        ? Palette.thisBlue
                                        : Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Palette.thisBlue, // Border color
                                    width: 2.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                context.read<CarPowerBloc>().add(
                                    CarGroup_OnButtonPressedIndex(getIndex: 2));
                              },
                              child: Text(
                                '10 ล้อ',
                                style: TextStyle(
                                  color:
                                      state.car_group_selectedButtonIndex == 2
                                          ? Colors.white
                                          : Palette.thisBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary:
                                    state.car_group_selectedButtonIndex == 3
                                        ? Palette.thisBlue
                                        : Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Palette.thisBlue, // Border color
                                    width: 2.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                context.read<CarPowerBloc>().add(
                                    CarGroup_OnButtonPressedIndex(getIndex: 3));
                              },
                              child: Text(
                                'พ่วง',
                                style: TextStyle(
                                  color:
                                      state.car_group_selectedButtonIndex == 3
                                          ? Colors.white
                                          : Palette.thisBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Adjust spacing between buttons
                        Expanded(
                          child: Container(
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary:
                                    state.car_group_selectedButtonIndex == 4
                                        ? Palette.thisBlue
                                        : Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Palette.thisBlue, // Border color
                                    width: 2.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                context.read<CarPowerBloc>().add(
                                    CarGroup_OnButtonPressedIndex(getIndex: 4));
                              },
                              child: Text(
                                'เทรลเลอร์',
                                style: TextStyle(
                                  color:
                                      state.car_group_selectedButtonIndex == 4
                                          ? Colors.white
                                          : Palette.thisBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                primary:
                                    state.car_group_selectedButtonIndex == 5
                                        ? Palette.thisBlue
                                        : Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Palette.thisBlue, // Border color
                                    width: 2.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                context.read<CarPowerBloc>().add(
                                    CarGroup_OnButtonPressedIndex(getIndex: 5));
                              },
                              child: Text(
                                'ลากตู้',
                                style: TextStyle(
                                  color:
                                      state.car_group_selectedButtonIndex == 5
                                          ? Colors.white
                                          : Palette.thisBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),
                //*--------------------------------------
                (state.car_group_selectedButtonIndex != -1)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'เลือกรูปแบบรถ',
                            style: TextStyle(
                                color: Palette.thisBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        splashFactory: NoSplash.splashFactory,
                                        primary: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          side:
                                              (state.car_type_selectedButtonIndex ==
                                                      0)
                                                  ? BorderSide(
                                                      color: Palette.theGreen,
                                                      width: 2.0,
                                                    )
                                                  : BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2.0,
                                                    ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      onPressed: () {
                                        context.read<CarPowerBloc>().add(
                                            CarType_OnButtonPressedIndex(
                                                getIndex: 0));

                                        showModalBottomSheet(
                                          context: context,
                                          isDismissible:
                                              false, // Prevents closing by tapping outside
                                          enableDrag: false,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                          builder: (context) =>
                                              BottomSheet_CarPower(),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${state.car_group_name} รูปแบบที่ 1 ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Palette.thisBlue),
                                              ),
                                              Text(
                                                'รายละเอียด',
                                                style: TextStyle(
                                                  color: Palette.theGrey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'เทรลเลอร์',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  (state.car_type_selectedButtonIndex == 0)
                                      ? Positioned(
                                          top:
                                              -9, // Adjust based on the size of the check mark
                                          right:
                                              3, // Adjust based on the size of the check mark
                                          child: ClipOval(
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              color: Colors.green,
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ))
                                      : Container()
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        splashFactory: NoSplash.splashFactory,
                                        primary: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          side:
                                              (state.car_type_selectedButtonIndex ==
                                                      1)
                                                  ? BorderSide(
                                                      color: Palette.theGreen,
                                                      width: 2.0,
                                                    )
                                                  : BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2.0,
                                                    ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      onPressed: () {
                                        context.read<CarPowerBloc>().add(
                                            CarType_OnButtonPressedIndex(
                                                getIndex: 1));

                                        showModalBottomSheet(
                                          context: context,
                                          isDismissible:
                                              false, // Prevents closing by tapping outside
                                          enableDrag: false,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                          builder: (context) =>
                                              BottomSheet_CarPower(),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${state.car_group_name} รูปแบบที่ 2 ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Palette.thisBlue),
                                              ),
                                              Text(
                                                'รายละเอียด',
                                                style: TextStyle(
                                                  color: Palette.theGrey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '++++++',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  (state.car_type_selectedButtonIndex == 1)
                                      ? Positioned(
                                          top:
                                              -9, // Adjust based on the size of the check mark
                                          right:
                                              3, // Adjust based on the size of the check mark
                                          child: ClipOval(
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              color: Colors.green,
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ))
                                      : Container()
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BottomSheet_CarPower extends StatefulWidget {
  @override
  _BottomSheet_CarPowerState createState() => _BottomSheet_CarPowerState();
}

class _BottomSheet_CarPowerState extends State<BottomSheet_CarPower> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'เลือกจำนวนรถ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Palette.thisBlue),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_counter > 1) _counter--;
                  });
                },
                icon: Icon(Icons.remove_circle_outline),
                iconSize: 36,
              ),
              SizedBox(width: 20),
              Text(
                '$_counter',
                style: TextStyle(fontSize: 24, color: Palette.theGrey),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_counter < 10) _counter++;
                  });
                  // setState(() {
                  //   _counter++;
                  // });
                },
                icon: Icon(Icons.add_circle_outline),
                iconSize: 36,
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              backgroundColor: Palette.theGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'บันทึก',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              backgroundColor: Palette.someRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              context
                  .read<CarPowerBloc>()
                  .add(CarType_OnButtonPressedIndex(getIndex: -1));

              Navigator.pop(context);
            },
            child: Text(
              'ยกเลิก',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
