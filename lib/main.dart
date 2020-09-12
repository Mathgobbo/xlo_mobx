import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlomobx/screens/base/base_screen.dart';
import 'package:xlomobx/stores/page_store.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());


//  final category = ParseObject('categories')..set<String>('Title', "Canetas")..set<int>("Position", 55);
//  final response = await category.save();
//  final category = ParseObject("categories")..objectId = "AAAA"..set<int>('Position', 3);
//  final response = await category.save();
//

}

Future<void> initializeParse() async{
  await Parse().initialize(
    "kFg0uLcRBg6bGtMi735P23wDu43POPBEAgnbRbYA",
    "https://parseapi.back4app.com/",
    clientKey: "5OrWrn06aUFb3a4j05uhgZZbcE1yz58qIDZrXKUg",
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        cursorColor: Colors.orange,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
