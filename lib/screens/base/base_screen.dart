import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlomobx/screens/home/home_screen.dart';
import 'package:xlomobx/stores/page_store.dart';

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final pageController = PageController(initialPage: 0);
  final PageStore pageStore = GetIt.I<PageStore>();


  @override
  void initState() {
    super.initState();
    reaction((_)=>pageStore.page, (page)=>pageController.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(color: Colors.greenAccent,),
          Container(color: Colors.red,),
          Container(color: Colors.pink,),
          Container(color: Colors.purple,),
        ],
      ),
    );
  }
}
