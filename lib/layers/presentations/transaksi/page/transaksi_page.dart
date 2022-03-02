import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future TransactionModal({
  required BuildContext context,
  List<ItemBottomSheet>? items,
}) {
  return Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHandle(context),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Buat",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.clear))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Column(
              children: items!.map((item) {
            return _ItemBottom(item: item);
          }).toList())
        ],
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      )),
      elevation: 1);
}

Widget _buildHandle(BuildContext context) {
  final theme = Theme.of(context);

  return FractionallySizedBox(
    widthFactor: 0.25,
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: Container(
        height: 5.0,
        decoration: BoxDecoration(
          color: theme.dividerColor,
          borderRadius: const BorderRadius.all(Radius.circular(2.5)),
        ),
      ),
    ),
  );
}

class _ItemBottom extends StatelessWidget {
  final ItemBottomSheet item;

  const _ItemBottom({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onClick,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ElevatedButton(
                onPressed: null,
                child: Image.asset(
                  item.image!,
                  width: 20,
                  height: 20,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: Color(0xFFE0DDDD), // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              item.judul!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

class ItemBottomSheet {
  final String? judul;
  final String? image;
  final Function()? onClick;

  ItemBottomSheet(
      {required this.judul, required this.onClick, required this.image});
}
