import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/CheckupResult_Method.dart';

class Test_Check extends StatefulWidget {
  @override
  State<Test_Check> createState() => _Test_CheckState();
}

class _Test_CheckState extends State<Test_Check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.thisBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
   
            // context.read<CarCheckBloc>().add(Count_PlusIndex(method: "reset"));
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'ทดสอบ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              CustomPaint(
                painter: ShapesPainter(),
                child: Container(height: 160),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: Column(
                  children: [
                    BlocBuilder<CarCheckBloc, CarCheckState>(
                      builder: (context, state) {
                        if (state.checkList1.length == 0) {
                          return Text('wait');
                        }

                        return Column(
                          children: [
                            Text('data'),
                            ListView.builder(
                                primary: true,
                                itemCount: 1,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Palette.thisBlue,
                                              width: 2),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Center(
                                        child: Text(
                                          state
                                              .checkList1[state.countIndexCheck]
                                              .name,
                                          style: TextStyle(
                                              color: Palette.thisBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  );

                                  // );
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: state.indexButtonSelect == 0
                                          ? Palette.theGreen
                                          : const Color.fromARGB(
                                              255, 190, 190, 190),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onPressed: () {
                                    context
                                        .read<CarCheckBloc>()
                                        .add(Swap_Index(getIndex: 0));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "ปกติ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: state.indexButtonSelect == 0
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: state.indexButtonSelect == 1
                                          ? Palette.someRed
                                          : const Color.fromARGB(
                                              255, 190, 190, 190),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onPressed: () {
                                    context
                                        .read<CarCheckBloc>()
                                        .add(Swap_Index(getIndex: 1));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "ไม่ปกติ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: state.indexButtonSelect == 1
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Palette.theGreen,
                                  elevation: 0,
                                  // side: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {
                                if (state.toCheckChecklist1 == 1) {
                                  context.read<CarCheckBloc>().add(StoreCheck1(
                                      getCheck1: CheckupResult_Item.checklist));
                                  // print('สรุป' +
                                  //     ChecklistItem.checklist.length
                                  //         .toString());
                                  // print('-----------------------');
                                  // for (var item in ChecklistItem.checklist) {
                                  //   print(item.result); // Print each item
                                  // }
                                } else {
                                  CheckupResult_Item.addItem(
                                      sysVehicleChecklistId: int.parse(state
                                          .checkList1[state.countIndexCheck].id
                                          .toString()),
                                      list: state
                                          .checkList1[state.countIndexCheck]
                                          .name,
                                      result: (context
                                                  .read<CarCheckBloc>()
                                                  .state
                                                  .indexButtonSelect ==
                                              0)
                                          ? 'ปกติ'
                                          : 'ไม่ปกติ',
                                      order: 1);

                                  context
                                      .read<CarCheckBloc>()
                                      .add(Count_PlusIndex(method: "+"));

                                  context
                                      .read<CarCheckBloc>()
                                      .add(Swap_Index(getIndex: 0));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "+ 1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
