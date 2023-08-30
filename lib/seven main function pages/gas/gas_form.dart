import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Gas_Form extends StatefulWidget {
  const Gas_Form({super.key});

  @override
  State<Gas_Form> createState() => _Gas_FormState();
}

class _Gas_FormState extends State<Gas_Form> {
DateTime current_date = DateTime.now();


  File? _image;
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'วันที่ ${current_date.day}/${current_date.month}/${current_date.year} | เวลา ${current_date.hour} : ${current_date.minute}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    //! form
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ไมล์ระยะทางปัจจุบัน',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // initialValue: 'password',

                      textAlign: TextAlign.left,
                      autofocus: false,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      // onSaved: (input) => passWord = input.toString(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'โปรดกรอกไมล์ระยะทางปัจจุบัน';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'กรอกไมล์ระยะทางปัจจุบัน',
                        labelStyle: const TextStyle(fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ปริมาณเติมจริง',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // initialValue: 'password',

                      textAlign: TextAlign.left,
                      autofocus: false,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      // onSaved: (input) => passWord = input.toString(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'โปรดกรอกปริมาณเติมจริง';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'กรอกปริมาณเติมจริง',
                        labelStyle: const TextStyle(fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'รวมเป็นเงิน',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // initialValue: 'password',

                      textAlign: TextAlign.left,
                      autofocus: false,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      // onSaved: (input) => passWord = input.toString(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'โปรดกรอกจำนวนเงินที่จ่าย';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'กรอกจำนวนเงินที่จ่าย',
                        labelStyle: const TextStyle(fontSize: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 238, 238, 238),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: _image == null
                          ? InkWell(
                              onTap: () {
                                _pickImageFromCamera();
                              },
                              child: Container(
                                color: Colors.grey,
                                height: 200,
                                width: double.infinity,
                                child: Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 100,
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                _pickImageFromCamera();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(183, 173, 173, 173),
                                  // border: Border.all(color: Colors.green)
                                ),
                                height: 200,
                                width: double.infinity,
                                child: Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          elevation: 0,
                          // side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      onPressed: () {
                        print('object');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text(
                            "เสร็จสิ้น",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
}
