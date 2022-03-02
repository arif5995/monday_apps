import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monday_app/commons/constant/images.dart';
import 'package:monday_app/commons/widgets/gridview_custom.dart';
import 'package:monday_app/commons/widgets/indicator_custom.dart';
import 'package:monday_app/commons/widgets/laporanitem_custom.dart';
import 'package:sliver_tools/sliver_tools.dart';

class LaporanPage extends StatelessWidget {
  const LaporanPage({Key? key}) : super(key: key);
  static const routeName = "/laporan_screen";

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF6F7F9),
      body: CustomScrollView(
        slivers: [
          SliverPinnedHeader(
              child: Container(
            height: 55,
            color: const Color(0xFFF6F7F9),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Laporan",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
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
                            Text("Januari 2022",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Grafik",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("Transaksi Per - Bulan",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey))
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        height: 200,
                        child: Container(
                          child: PieChart(PieChartData(
                              startDegreeOffset: 270,
                              borderData: FlBorderData(show: false),
                              sectionsSpace: 1,
                              centerSpaceRadius: 0,
                              sections: showingSection())),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 40, top: 10),
                        child: GridViewCustom(
                          context: context,
                          mSpacing: 10,
                          cSpacing: 50,
                          count: 2,
                          height: 28,
                          item: [
                            Indicator(
                              textColor: Colors.black,
                              text: "Pemasukan",
                              color: Color(0xFF21E002),
                              isSquare: false,
                              size: 16,
                            ),
                            Indicator(
                              textColor: Colors.black,
                              text: "Piutang",
                              color: Color(0xFFCCD2E3),
                              isSquare: false,
                              size: 16,
                            ),
                            Indicator(
                              textColor: Colors.black,
                              text: "Pengeluaran",
                              color: Color(0xFFFD2727),
                              isSquare: false,
                              size: 16,
                            ),
                            Indicator(
                              textColor: Colors.black,
                              text: "Hutang",
                              color: Color(0XFFFF8B20),
                              isSquare: false,
                              size: 16,
                            )
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LaporanItemCustom(
                        title: "Pemasukan",
                        image: ConstantImage.PEMASUKAN_SMALL,
                        context: context,
                        color: Color(0xFF21E002),
                        total: ""),
                    LaporanItemCustom(
                        title: "Pengeluaran",
                        image: ConstantImage.PENGELUARAN_SMALL,
                        context: context,
                        color: Color(0xFFFD2727),
                        total: "12 K"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LaporanItemCustom(
                        title: "Piutang",
                        image: ConstantImage.PIUTANG_SMALL,
                        context: context,
                        color: Color(0xFFCCD2E3),
                        total: "1 JT"),
                    LaporanItemCustom(
                        title: "Hutang",
                        image: ConstantImage.HUTANG_SMALL,
                        context: context,
                        color: Color(0xFFFF8B20),
                        total: "1 JT"),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSection() {
    return [
      PieChartSectionData(
        color: Colors.red,
        value: 20,
        title: "yellow pie",
        radius: 100,
        titleStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        titlePositionPercentageOffset: 0.99,
      ),
      PieChartSectionData(
        color: Colors.yellow,
        value: 30,
        title: "yellow pie",
        radius: 100,
        titleStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        titlePositionPercentageOffset: 0.99,
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 20,
        title: "yellow pie",
        radius: 100,
        titleStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        titlePositionPercentageOffset: 0.99,
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 15,
        title: "yellow pie",
        radius: 100,
        titleStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        titlePositionPercentageOffset: 0.99,
      )
    ];
  }
}
