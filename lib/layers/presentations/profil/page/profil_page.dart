import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/commons/widgets/textformfield_custom.dart';
import 'package:monday_app/layers/presentations/profil/controller/profilController.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);
  static const routeName = "/profil_screen";

  @override
  Widget build(BuildContext context) {
    TextEditingController _nama = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPinnedHeader(
            child: SizedBox(
              child: Container(
                height: 55,
                color: const Color(0xFFF6F7F9),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Profil",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    GetBuilder<ProfilController>(
                      init: ProfilController(),
                      builder: (prof) {
                        return Row(
                          children: [
                            Visibility(
                              visible: prof.edit,
                              child: TextButton.icon(
                                onPressed: () {
                                  prof.changeButton();
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.grey,
                                ),
                                icon: Icon(
                                  Icons.edit,
                                  size: 18,
                                ),
                                label: Text(
                                  'Edit',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: prof.cancel,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  prof.resetButton();
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.grey,
                                ),
                                icon: Icon(
                                  Icons.clear,
                                  size: 18,
                                ),
                                label: Text(
                                  'Batal',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Visibility(
                              visible: prof.save,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  prof.resetButton();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF02A2E0),
                                ),
                                icon: Icon(
                                  Icons.save,
                                  size: 18,
                                ),
                                label: Text(
                                  'Simpan',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            )
                            // Visibility(child: child)
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Center(
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormFieldCustom.TextFormFieldProfil(
                      controller: _nama,
                      inputTipe: TextInputType.text,
                      hint: "Nama Panggilan"),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormFieldCustom.TextFormFieldProfil(
                      controller: _nama,
                      inputTipe: TextInputType.emailAddress,
                      hint: "Email"),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormFieldCustom.TextFormFieldProfil(
                      controller: _nama,
                      inputTipe: TextInputType.number,
                      hint: "No. Telp"),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormFieldCustom.TextFormFieldProfil(
                      controller: _nama,
                      inputTipe: TextInputType.number,
                      hint: "NIK"),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 2,
                        child: TextFormFieldCustom.TextFormFieldProfil(
                            controller: _nama,
                            inputTipe: TextInputType.number,
                            hint: "NIK"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 3,
                        child: TextFormFieldCustom.TextFormFieldProfil(
                            controller: _nama,
                            inputTipe: TextInputType.number,
                            hint: "NIK"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormFieldCustom.TextFormFieldProfil(
                      controller: _nama,
                      inputTipe: TextInputType.text,
                      hint: "Alamat")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
