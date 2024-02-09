import 'package:flutter/material.dart';
import 'package:untitled13/compoent/bottom_nav_bar.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIdex=0;
  void navigateBottomBar(int newIndex){
    setState(() {
      selectedIdex=newIndex;

    });
  }
  final List<Widget>pages=[
    ShopPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
    bottomNavigationBar: MyBottomNavBar (
        onTabChange:(index)=>navigateBottomBar(index),
    ),
      body:pages[selectedIdex] ,
    );
  }
}
