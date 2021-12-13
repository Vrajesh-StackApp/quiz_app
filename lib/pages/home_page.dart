import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/model/options.dart';
import 'package:quiz_app/utils/app_string.dart';
import 'package:quiz_app/widget/listtile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OptionProvider provider = OptionProvider();

  _getOptionList(){
    provider = Provider.of(context);
    provider.optionList = optionList;
  }

  List<Options> optionList = [
    Options(id: 1,name: "Apple"),
    Options(id: 2,name: "Java"),
    Options(id: 3,name: "Cat"),
    Options(id: 4,name: "Jetbrains"),
  ];

  int selectedIndex = -1;
  int answerIndex = 2;

  @override
  Widget build(BuildContext context) {
    _getOptionList();

    return SafeArea(child: Scaffold(
      appBar: _appBar(),
      body: _homeBody(),
    ),);
  }

  PreferredSizeWidget? _appBar() => AppBar(
    title: Text(AppString.homeAppBar),
    backgroundColor: Colors.blue,
  );

  Widget? _homeBody() => Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border:Border.all(width: 1.0,color: Colors.black),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: Column(
      children: [
        Text(AppString.question),
        const SizedBox(height: 8),
        Consumer<OptionProvider>(
          builder: (context, model, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTileWidget(
                  index: index,
                  name: model.options[index].name,
                  onTap: onTap,
                  selectedIndex:model.selectedIndex,
                  answerIndex:model.answerIndex,
                  tapDisable:model.tapDisable,
                );
              },
              itemCount: model.options.length,
            );
          },
        ),
      ],
    ),
  );

  Function? onTap(int index){
    provider.changeValue(index,context);
    // provider.selectedIndex = index;

    // setState(() {
    //   selectedIndex = index;
      // optionList[index].isSelected = !optionList[index].isSelected!;
    // });
  }



}
