import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kds_app/Screens/menu/order_confirm.dart';

class AddToCart extends StatefulWidget {
  static const routeName = '/AddToCart';
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff26272C),
      appBar: AppBar(
        backgroundColor: const Color(0xff26272C),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    //  Navigator.pushNamed(context, AddToCart.routeName);
                  },
                  child: Text('Add to Cart',
                      style: GoogleFonts.getFont(
                        'Poppins',
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const SizedBox(
                      height: 70,
                      width: 70,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/pizza3.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Extra Cheese Pizza',
                      style: GoogleFonts.getFont('Poppins',
                          color: Colors.white, fontSize: 17),
                    ),
                    subtitle: Column(children: [
                      Row(
                        children: [
                          // if (isSelected ||countsList[index][itemIndex] >
                          //                   0 )
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      // if (countsList[index][itemIndex] >
                                      //     0) {
                                      //   countsList[index][itemIndex]--;
                                      // }
                                    });
                                  },
                                  color: Colors.white,
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '1',
                                      // countsList[index][itemIndex]
                                      //     .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      //  countsList[index][itemIndex]++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // const Row(
                      //   children: [
                      //     Text(
                      //       'Extra Cheese',
                      //       style: GoogleFonts.getFont('Poppins',
                      //         color: Colors.white,
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ]),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Text(
                        '\$5:00',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  height: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 223.5,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  color: const Color(0xff131218),
                  height: 60,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$74.00',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderConfirmScreen.routeName);
                  },
                  child: Container(
                    color: Colors.green,
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Finish Ordering',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
