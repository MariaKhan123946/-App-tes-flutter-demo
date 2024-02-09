import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled13/models/drink.dart';

class DrinkTile extends StatefulWidget {
  final Drink drink;
  void Function()? onTap;
  final Widget trailing;

   DrinkTile({Key? key,  required this.onTap,required this.trailing, required this.drink})
      : super(key: key);

  @override
  State<DrinkTile> createState() => _DrinkTileState();
}

class _DrinkTileState extends State<DrinkTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.brown[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(widget.drink.name),
          subtitle: Text(widget.drink.price),
          leading: Lottie.asset(widget.drink.imagepath),
          trailing:widget.trailing ,
        ),
      ),
    );
  }
}
