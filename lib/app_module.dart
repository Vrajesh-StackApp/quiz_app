import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/utils/app_string.dart';

class AppModule extends Module{

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(AppString.homePage, child: (_, __) => const HomePage()),
  ];

}