import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/commons/constant/color_gradients.dart';
import 'package:monday_app/commons/helpers/global_method_helper.dart';
import 'package:monday_app/commons/widgets/strip_bottomsheet.dart';
import 'package:monday_app/commons/widgets/textformfield_custom.dart';
import 'package:monday_app/layers/presentations/inbox/controller/InboxController.dart';

class AddInboxPage extends StatelessWidget {
  const AddInboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catatanController = Get.find<InboxController>();
    TextEditingController judul = TextEditingController();
    TextEditingController deskripsi = TextEditingController();
    TimeOfDay _time = TimeOfDay.now();

    bool? _swith = false;

    return Scaffold(
        backgroundColor: const Color(0xFFF6F7F9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          elevation: 0,
          flexibleSpace: ColorGradients.blueGradient(),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tambah Catatan",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                "Rabu, 10 Februari 2022",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            ColorGradients.blueGradient(),
            Positioned(
              top: 20,
              bottom: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                          offset: Offset(-1, -1), // changes position of shadow
                        ),
                      ]),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              BuildHandle(context),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormFieldCustom.TextFormFieldAddBox(
                                controller: judul,
                                hint: "Judul",
                                inputTipe: TextInputType.text,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormFieldCustom.TextFormFieldAddBox(
                                  controller: deskripsi,
                                  hint: "Deskripsi",
                                  inputTipe: TextInputType.multiline,
                                  maxline: 5,
                                  height: 200),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: const Text("Set Timer"),
                                      ),
                                      Obx(() => Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(showPicker(
                                                          value: _time,
                                                          iosStylePicker: true,
                                                          onChange: (time) {
                                                            catatanController
                                                                .changeTime(
                                                                    time,
                                                                    context);
                                                          }));
                                                },
                                                child: Text(
                                                  GlobalMethodHelper.isEmpty(
                                                          catatanController
                                                              .setTimer.value)
                                                      ? _time.format(context)
                                                      : catatanController
                                                          .setTimer.value,
                                                  style: TextStyle(
                                                      fontSize: 60,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: catatanController
                                                              .switchTimer.value
                                                          ? Colors.black
                                                          : Colors.grey),
                                                ),
                                              ),
                                              Icon(
                                                CupertinoIcons.cloud_sun,
                                                size: 35,
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  Obx(
                                    () => CupertinoSwitch(
                                        value:
                                            catatanController.switchTimer.value,
                                        onChanged: (val) {
                                          print("TT $val");
                                          catatanController.NotifTimer();
                                        }),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(left: 10),
                              //       child: const Text("Notifikasi"),
                              //     ),
                              //     LiteRollingSwitch(
                              //       // sizeHight: 20,
                              //       value: true,
                              //       textOn: 'On',
                              //       textOff: 'Off',
                              //       colorOn: Colors.greenAccent[700]!,
                              //       colorOff: Colors.grey,
                              //       iconOn: CupertinoIcons.alarm,
                              //       iconOff: CupertinoIcons.alarm_fill,
                              //       textSize: 16.0,
                              //       onChanged: (bool state) {
                              //         //Use it to manage the different states
                              //         print(
                              //             'Current State of SWITCH IS: $state');
                              //       },
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
