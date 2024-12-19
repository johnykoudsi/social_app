import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomNavigatorWidget extends StatelessWidget {
  CustomNavigatorWidget({
    Key? key,
    required this.selectedIndex,
    required this.widgetIndex,
    required this.svgPath,
  }) : super(key: key);

  final int selectedIndex;
  final int widgetIndex;

  String svgPath;
  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    return Container(
        height: getWidth * 0.1,
        width: getWidth * 0.1,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color:
          selectedIndex == widgetIndex ? Colors.white : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            height: 20,
            width: 20,
            svgPath,
            color: selectedIndex == widgetIndex
                ? Colors.black
                : Colors.grey,
          ),
        ));
  }
}
