// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;
  SmartDeviceBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.black : Colors.grey[100],
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 26),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //icons
                Image.asset(
                  iconPath,
                  color: powerOn ? Colors.white : Colors.black,
                  height: 80,
                ),

//smart device name + switch
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        smartDeviceName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: powerOn ? Colors.white : Colors.black),
                      ),
                    )),
                    Transform.rotate(
                        angle: pi / 2,
                        child: CupertinoSwitch(
                            value: powerOn, onChanged: onChanged))
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
