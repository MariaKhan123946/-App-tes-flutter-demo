import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';
import '../models/drink_Tile.dart';
import '../models/shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    Drink drink = value.cart[index];
                    return DrinkTile(
                      drink: drink,
                      onTap: () => removeFromCart(drink),
                      trailing: Icon(Icons.delete), // Fix the property name here
                    );
                  },
                ),
              ),
              MaterialButton(
                child: Text(
                  'PAY',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.brown,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
