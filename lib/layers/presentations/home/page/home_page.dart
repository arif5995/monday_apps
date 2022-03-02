import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/commons/constant/images.dart';
import 'package:monday_app/commons/shimers/custom_shimmer.dart';
import 'package:monday_app/layers/presentations/home/controller/homeController.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    ///bool
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverPinnedHeader(
              child: Container(
            color: Color(0xFFF6F7F9),
            padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Center(
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage("assets/images/user.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Jhon",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text("good morning",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                RawMaterialButton(
                  onPressed: () {},
                  child: Image.asset(
                    ConstantImage.NOTIFICATION_SMALL,
                    width: 30,
                    height: 30,
                  ),
                  shape: new CircleBorder(),
                  elevation: 4.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(5.0),
                ),
              ],
            ),
          )),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(1, 4), // changes position of shadow
                        ),
                      ]),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            ConstantImage.MATAHARI,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Kamis, 21 Januari 2022",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            SizedBox(
                              width: 8,
                            ),
                            // Flexible(
                            //   fit: FlexFit.loose,
                            //   child: Image.asset(
                            //     ConstantHelper.MATAHARI,
                            //     width: 24,
                            //     height: 24,
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Laporan",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("Hari ini",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("see more",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue)),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 10,
                            color: Color(0xFF0593CB),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ),

          /// REPORT TRANSACTION
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black26,
                  //     blurRadius: 8,
                  //     offset: Offset(1, 4), // changes position of shadow
                  //   ),
                  // ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFD6FEAF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.arrow_circle_up,
                            size: 30,
                            color: Color(0xFF21FA1C),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pemasukan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey)),
                            Row(
                              children: [
                                Text("Rp", style: TextStyle(fontSize: 12)),
                                Text("25K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFFEAFAF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.arrow_circle_down,
                            size: 30,
                            color: Color(0xFFFA1C1C),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pemasukan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey)),
                            Row(
                              children: [
                                Text("Rp", style: TextStyle(fontSize: 12)),
                                Text("25K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 20),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Dompet",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("see more",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue)),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 10,
                            color: Color(0xFF0593CB),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ),

          SliverPersistentHeader(
              floating: false, pinned: false, delegate: _userDeposit()),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

          SliverPinnedHeader(
            child: Container(
              color: Color(0xFFF6F7F9),
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text("Menu Pilihan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),

          SliverPinnedHeader(
              child: Container(
            color: Color(0xFFF6F7F9),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ItemMenu(
                        assetImage: ConstantImage.IMAGE_ASSET_DEPOSIT,
                        itemName: "Deposit",
                        onTap: () {
                          print("tuiooii");
                        }),
                    ItemMenu(
                        assetImage: ConstantImage.IMAGE_ASSET_DEPOSIT,
                        itemName: "Deposit",
                        onTap: () {}),
                    ItemMenu(
                        assetImage: ConstantImage.IMAGE_ASSET_DEPOSIT,
                        itemName: "Deposit",
                        onTap: () {}),
                    ItemMenu(
                        assetImage: ConstantImage.IMAGE_ASSET_DEPOSIT,
                        itemName: "Deposit",
                        onTap: () {}),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black26,
                    //       offset: Offset(0, -2),
                    //       blurRadius: 0.5,
                    //       spreadRadius: 0.1)
                    // ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Transaction",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("see more",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          alignment: const Alignment(1.0, 1.0),
                          children: [
                            TextField(
                              onChanged: (String val) {
                                if (val.isNotEmpty) {
                                  controller.changeiconsearch(true);
                                  print("tess1");
                                } else {
                                  controller.changeiconsearch(false);
                                  print("tess2");
                                }
                              },
                              controller: _searchController,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  focusColor: Colors.grey,
                                  hintText: "Cari....",
                                  border: InputBorder.none),
                            ),
                            Obx(() => controller.search.value
                                ? IconButton(
                                    onPressed: () {
                                      _searchController.clear();
                                      controller.changeiconsearch(false);
                                    },
                                    icon: Icon(Icons.clear),
                                  )
                                : IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.search),
                                  ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),

          /// LIST TRANSACTION
          SliverStack(
            insetOnOverlap: false,
            children: [
              SliverPositioned.fill(
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // boxShadow: const <BoxShadow>[
                      //   BoxShadow(
                      //     color: Colors.black26,
                      //     blurRadius: 8,
                      //     offset: Offset(1, 4), // changes position of shadow
                      //   ),
                      // ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                        height: 70,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// NOTE ITEM LOGO
                                Flexible(
                                    flex: 1,
                                    fit: FlexFit.loose,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(

                                            /// colors can custome
                                            color: Color(0xffa6e6f6),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            /// icon can changed
                                            Icon(Icons.event,
                                                size: 24, color: Colors.white),

                                            /// can text in accordance from icon
                                            FittedBox(
                                              fit: BoxFit.fill,
                                              child: Text(
                                                "Beri Pinjaman",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                Flexible(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Burger King",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Mandiri",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              "Hutang",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "20.000",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "IDR",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Burger King",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        ));
                  }, childCount: 8),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _userDeposit extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: 50,
            decoration: BoxDecoration(
                color: Color(0xFF02A2E0),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ]),
            child: Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Text("Add Bill",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      ConstantImage.ADD_BILL_SMALL,
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: CustomShimmer.rectangular(
                      height: 100,
                      width: 300,
                      circularr: 20,
                    )),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: 300,
                    height: 100,
                  ),
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: 300,
                    height: 100,
                  ),
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: 300,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 150;

  @override
  // TODO: implement minExtent
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

Widget ItemMenu({Function()? onTap, String? itemName, String? assetImage}) {
  return Column(
    children: [
      RawMaterialButton(
        onPressed: onTap,
        child: Image.asset(
          assetImage ?? "",
          width: 30,
          height: 30,
        ),
        shape: new CircleBorder(),
        elevation: 4.0,
        fillColor: Colors.white,
        padding: const EdgeInsets.all(15.0),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        itemName ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      )
    ],
  );
}
