import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/model/options.dart';

class ListTileWidget extends StatelessWidget {
  final int? index;
  final int? id;
  final String? name;
  final Function? onTap;
  final int? selectedIndex;
  final int? answerIndex;
  final bool? tapDisable;

  const ListTileWidget({
    Key? key,
    this.index,
    this.id,
    this.name,
    this.onTap,
    this.selectedIndex,
    this.answerIndex,
    this.tapDisable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1.0, color: Colors.black),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        title: Text(
          "${index! + 1}. $name",
          style: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        trailing: GestureDetector(
          onTap: tapDisable!
              ? null
              : () {
                  onTap!.call(index);
                  print("Selected index ==> $index");
                },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: isSelected() == null
                  ? Colors.white
                  : isSelected()
                      ? Colors.green
                      : Colors.red,
              border: Border.all(width: 1.0, color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            child: isSelected() == null
                ? Container()
                : isSelected()
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
          ),
        ),
      ),
    );
  }

  isSelected() {
    if (selectedIndex == index && answerIndex == selectedIndex) {
      return true;
    } else if (selectedIndex == index && answerIndex != selectedIndex) {
      return false;
    } else {
      return null;
    }
  }
}
