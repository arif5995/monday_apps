import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final bool showElevation;
  final double? containerHeight;
  final List<BottomNavvBarItem> items;
  final ValueChanged<int> onItemSelected;
  final Duration animationDuration;
  final int selectedIndex;
  final Color? backgroundColor;

  const CustomBottomBar(
      {Key? key,
      this.showElevation = true,
      this.containerHeight,
      required this.items,
      required this.onItemSelected,
      this.animationDuration = const Duration(milliseconds: 270),
      this.selectedIndex = 0,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  middle: item.middle,
                  animationDuration: animationDuration,
                  isSelected: index == selectedIndex,
                  item: item,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final BottomNavvBarItem item;
  final bool isSelected;
  final Duration animationDuration;
  final bool middle;

  const _ItemWidget(
      {Key? key,
      required this.item,
      required this.isSelected,
      required this.animationDuration,
      required this.middle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: isSelected,
      container: true,
      child: AnimatedContainer(
          duration: animationDuration,
          child: middle
              ? RawMaterialButton(
                  onPressed: item.tap,
                  child: Image.asset(
                    item.iconWhite,
                    width: 24,
                    height: 24,
                  ),
                  shape: new CircleBorder(),
                  elevation: 4.0,
                  fillColor: Color(0xFF02A2E0),
                  padding: const EdgeInsets.all(10.0),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      isSelected ? item.iconActive : item.iconDeactive,
                      width: 23,
                      height: 23,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      item.title,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected
                              ? Color(0xFF0487FF)
                              : Color(0xFFB9B5B5)),
                    )
                  ],
                )),
    );
  }
}

class BottomNavvBarItem {
  final String iconActive;
  final String iconDeactive;
  final String iconWhite;
  final String title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
  final bool middle;
  final Function()? tap;

  BottomNavvBarItem(
      {required this.iconActive,
      required this.iconDeactive,
      this.iconWhite = "",
      required this.title,
      this.activeColor = Colors.blue,
      this.inactiveColor,
      this.textAlign,
      this.middle = false,
      this.tap});
}
