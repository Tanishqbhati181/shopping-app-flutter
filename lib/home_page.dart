import 'package:flutter/material.dart';
import 'package:shopping_app/product_list.dart';
import 'package:shopping_app/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // EDIT: Humne IndexedStack hata diya kyunki vo state ko freeze kar deta hai.
      // Ab ye har tap par fresh UI render karega jisse cart items turant dikhenge!
      body: currentScreen == 0 ? const ProductList() : const CartPage(),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        currentIndex: currentScreen,
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
