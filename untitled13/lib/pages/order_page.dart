import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:untitled13/models/drink.dart';

import '../models/shop.dart';

class Orderpage extends StatefulWidget {
  final Drink drink;
  const Orderpage({Key? key, required this.drink}) : super(key: key);

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  double sweetValue = 0.5;

  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;

  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlsValue = 0.5;

  void customizePearls(double newValue) {
    setState(() {
      pearlsValue = newValue;
    });
  }

  void addToCart() {
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 200, // Set the desired height
              child: Lottie.asset(widget.drink.imagepath),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('Sweet'),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('Ice'),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('Pearls'),
                    ),
                    Expanded(
                      child: Slider(
                        value: pearlsValue,
                        label: pearlsValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearls(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MaterialButton(
            child: Text(
              'Add to cart',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.brown,
            onPressed: addToCart,
          ),
        ],
      ),
    );
  }
}
