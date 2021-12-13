import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Options{
  int? id;
  String? name;

  Options({this.id,this.name});
}

class OptionProvider extends ChangeNotifier{
  List<Options>? optionList = [];
  int? selectedIndex = -1;
  int? answerIndex = 2;
  int? counter = 0;
  bool? tapDisable = false;

  List<Options> get options {
    return optionList!;
  }

  set options(List<Options> newOptions){
      optionList = newOptions;
      notifyListeners();
  }

  changeValue(int index, BuildContext context)
  {
      selectedIndex = index;
      counter = counter! + 1;
      if(counter == 2){
        tapDisable = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have no more try..!")));
      }
      else
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have left 1 try..!")));
        }

      notifyListeners();
  }

}