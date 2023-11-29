import 'package:flutter/material.dart';
import 'package:kds_app/Screens/home/home_screen.dart';
import 'package:kds_app/Screens/menu/addToCart.dart';
import 'package:kds_app/Screens/menu/menu_screen.dart';
import 'package:kds_app/Screens/menu/order_confirm.dart';
import 'package:kds_app/Screens/pin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'KDS App',
  routes: {
    HomeScreen.routeName:(context) => const HomeScreen(),
    MenuScreen.routeName: (context) =>  MenuScreen(),
    AddToCart.routeName:(context) => AddToCart(),
    OrderConfirmScreen.routeName:(context) => OrderConfirmScreen(),
    
  },
      home: const PinScreen(),
    );
  }
}
