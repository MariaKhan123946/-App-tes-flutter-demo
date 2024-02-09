import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled13/pages/order_page.dart';

import '../models/drink.dart';
import '../models/drink_tile.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  void goToOrderPage(BuildContext context, Drink drink) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Orderpage(
          drink: drink,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop?>(
      builder: (context, value, child) {
        if (value == null) {
          // Handle the case where BubbleTeaShop is null
          return CircularProgressIndicator(); // or any other loading indicator
        }

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Text("Bubble Tea Shop", style: TextStyle(fontSize: 20)),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      Drink individualDrink = value.shop[index];
                      return DrinkTile(
                        drink: individualDrink,
                        onTap: () => goToOrderPage(context, individualDrink),

                        trailing: Icon(Icons.arrow_forward),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
