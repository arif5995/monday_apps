import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double circularr;

  // const CircleShimmer(
  //     {Key? key,
  //     required this.width,
  //     required this.height,
  //     required this.shapeBorder})
  //     : super(key: key);

  const CustomShimmer.rectangular(
      {required this.width, required this.height, required this.circularr}
  );

  const CustomShimmer.circular(
      {this.width = double.infinity,
      required this.height, this.circularr = 0});


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          width: width,
          height: height,
          decoration:
              ShapeDecoration(color: Colors.grey[400]!,
                  shape: circularr == 0 ? CircleBorder() : RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(circularr))),
        ),),
        baseColor: Colors.white,
        highlightColor: Colors.grey[300]!);
  }
}
