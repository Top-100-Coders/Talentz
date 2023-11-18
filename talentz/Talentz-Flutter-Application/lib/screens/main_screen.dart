import 'package:flutter/material.dart';

import 'home/home_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  int index = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
super.initState();
  }


  final pages = <Widget>[
    const HomeScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: pages[index],
      // bottomNavigationBar: BottomNavigationBar(
      //     items:  const <BottomNavigationBarItem>[
      //
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home_filled),
      //         label: "Home" ,
      //       ),
      //
      //     ],
      //     currentIndex: index,
      //     onTap: (value){
      //       setState(() {
      //         index = value;
      //       });
      //     }
      // ),

      //
      // TabBarMaterialWidget(
      //   index: index,
      //   onChangedTab: onChangedTab,
      // ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
 });
   }
}