import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/ProgressHUD.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';

class Job_Process extends StatefulWidget {
  Job_Process() : super();
  @override
  _Job_ProcessState createState() => _Job_ProcessState();
}

class _Job_ProcessState extends State<Job_Process> {
  List<File> selectedImages = [];
  final picker = ImagePicker();
  String statusImag = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiProcess(context),
            inAsyncCall: state.isLoading,
            opacity: 0.3);
      },
    );
  }

  Widget _uiProcess(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Palette.thisBlue,
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
            title: Text(
              'id location: ' +
                  state.job_info.currentLocation.currentLocation_id.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 1, 44, 97),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Palette.someRed,
                            ),
                            Text(
                              state.job_info.currentLocation
                                      .currentLocation_checkinCategory +
                                  ": ",
                              style: TextStyle(
                                color: Color.fromARGB(255, 97, 97, 97),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              state.job_info.currentLocation
                                  .currentLocation_point,
                              style: TextStyle(
                                color: Palette.thisBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        SvgPicture.asset(
                          'assets/images/dest.svg',
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "เวลาที่ควรถึง",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 97, 97, 97),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  state.job_info.currentLocation
                                      .currentLocation_date,
                                  style: TextStyle(
                                    color: Palette.thisBlue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 246, 246),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "เหลือเวลา",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 97, 97, 97),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "06:25:15",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                selectedImages.isEmpty
                    ? Container()
                    : Text(
                        'รูปภาพที่แนบ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: selectedImages.isEmpty ? null : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      child: selectedImages.isEmpty
                          ? const Text(' ')
                          : GridView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: selectedImages.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                    child: Card(
                                  child: SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: Image.file(
                                      selectedImages[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ));
                              },
                            ),
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                     
                          openImageDialog(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              selectedImages.isEmpty
                                  ? 'ถึง' +
                                      state.job_info.currentLocation
                                          .currentLocation_checkinCategory +
                                      'แล้ว'
                                  : 'เพิ่มรูปภาพ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                (selectedImages.isEmpty)
                    ? Text('')
                    : Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (state.job_info.currentLocation
                                            .currentLocation_checkinCategory ==
                                        'จุดรับสินค้า') {
                                      statusImag = 'files[pickupImage][]';
                                    } else if (state.job_info.currentLocation
                                            .currentLocation_checkinCategory ==
                                        'จุดส่งสินค้า') {
                                      statusImag = 'files[deployImage][]';
                                    } else if (state.job_info.currentLocation
                                            .currentLocation_checkinCategory ==
                                        'จุดรับตู้') {
                                      statusImag = 'files[getContainerImage][]';
                                    } else if (state.job_info.currentLocation
                                            .currentLocation_checkinCategory ==
                                        'จุดบรรจุ') {
                                      statusImag =
                                          'files[installContainerImage][]';
                                    } else if (state.job_info.currentLocation
                                            .currentLocation_checkinCategory ==
                                        'จุดคืนตู้') {
                                      statusImag =
                                          'files[returnContainerImage][]';
                                    } else {
                                      null;
                                    }
                                    //! ส่งเปลี่ยนสถานะ
                                    // print(state
                                    //     .job_info
                                    //     .checkInLocation_Info[state.count]
                                    //     .checkinCategory);

                                    print('new '+state.job_info.currentLocation
                                        .currentLocation_checkinCategory);
                                    context.read<JobsBloc>().add(
                                        Upload_Pics_Jobs(
                                            getCurrentLocationID: state
                                                .job_info
                                                .currentLocation
                                                .currentLocation_id,
                                            imageFileName: statusImag,
                                            hasFinished: false,
                                            hasDeliveredOverTime: false,
                                            hasPickedOverTime: false,
                                            type: state.job_info.currentLocation
                                                .currentLocation_checkinCategory,
                                            context: context,
                                            getJoNumber: state
                                                .job_info.docNumber
                                                .toString(),
                                            files: selectedImages));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'ส่ง',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Palette.thisBlue,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  openImageDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true, // <-- Set it to true

            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              children: [
                Center(
                  child: Text(
                    'ภาพถ่ายยืนยัน',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.thisBlue),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _getToCamera();
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/images/cam.svg'),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'กล้อง',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {
                        _getGallery();
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/images/gal.svg'),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'อัลบั้ม',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Future<void> _getToCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        selectedImages.add(File(pickedImage.path));
      });
    }
  }

  Future _getGallery() async {
    dynamic pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text(' ')));
        }
      },
    );
  }
}
