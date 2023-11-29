import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderConfirmScreen extends StatefulWidget {
  static const routeName = '/OrderConfirmScreen';
  const OrderConfirmScreen({super.key});

  @override
  State<OrderConfirmScreen> createState() => _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff131218),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Text(
                'WE MUST SAY,',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                'YOU\'VE GREATE CHOICE OF TASTE',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
               const SizedBox(height: 50,),
              const SizedBox(
                height: 250,
                width: 250,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pizza4.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Text(
                'ORDER CONFIRMED WITH',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                'QSR',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50,),
              Text(
                'YOUR ORDERD WILL BE AT YOUR TABLE',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                'ANYTIME SOON.',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
