import 'package:flutter/material.dart';

Widget LaporanItemCustom({
  required BuildContext context,
  required String title,
  required String image,
  String? total,
  Color? color,
}) {
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width * 0.42,
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
    child: Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: color,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Laporan",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                image,
                width: 60,
                height: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hari Ini ±",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              total!.isNotEmpty
                  ? Text(
                      "Rp. ${total}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    )
                  : Text(
                      "Belum Ada",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
            ],
          ),
        ),
      ),
    ),
  );
}
