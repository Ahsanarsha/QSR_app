import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kds_app/Screens/menu/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    print('isPortrait $isPortrait');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color(0xff26272C),
          // foregroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            'KDS',
            style: GoogleFonts.getFont('Poppins', color: Colors.white),
          ),
          // actions: const [
          //   Icon(Icons.add_shopping_cart_outlined)
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isPortrait ? 2 : 4,
                    childAspectRatio: isPortrait ? 1.6 : 1.9,
                  ),
                  itemCount: 10, // Set the number of items you want in the grid
                  itemBuilder: (BuildContext context, int index) {
                    Color itemColor = index % 3 == 0
                        ? const Color(0xff25A218)
                        : index % 3 == 1
                            ? const Color(0xffFBAF03)
                            : const Color(0xff26272C);
                    String itemText =
                        index % 3 == 2 ? 'No Orders' : 'Orders 5 items';
                    String itemTime = index % 3 == 2
                        ? ''
                        : index % 3 == 1
                            ? '3:22'
                            : '1:33';
                    // Create widgets for each grid item
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: itemColor,
                      child: InkWell(
                        onTap: () {
                          // Navigate to the same screen
                          Navigator.pushNamed(context, MenuScreen.routeName);
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Table ${index + 1}',
                                      style: GoogleFonts.getFont('Poppins',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      itemTime,
                                      style: GoogleFonts.getFont('Poppins',
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: isPortrait ? 50 : 45,
                                ),
                                Text(
                                  itemText,
                                  style: GoogleFonts.getFont('Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
