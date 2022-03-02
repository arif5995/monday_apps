import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/commons/widgets/strip_bottomsheet.dart';
import 'package:monday_app/layers/presentations/inbox/controller/inbox_binding.dart';
import 'package:monday_app/layers/presentations/inbox/page/add_inbox_page.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);
  static const routeName = "/inbox_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPinnedHeader(
            child: Container(
              height: 55,
              // color: const Color(0xFFF6F7F9),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Catatan",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                      splashRadius: 5,
                      onPressed: () {
                        Get.to(AddInboxPage(),
                            transition: Transition.downToUp,
                            binding: InboxBinding());
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 24,
                        color: Colors.black,
                      ))
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SfDateRangePicker(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
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
              child: Column(
                children: [BuildHandle(context)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
