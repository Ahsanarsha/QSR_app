import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kds_app/Screens/menu/addToCart.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = '/MenuScreen';
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<List<int>> countsList = List.generate(6, (index) => List.filled(10, 0));
  int count = 1;
  int selectedIndex = 0;
  int? singleItemIndex;
  int? singleCatIndex;

  final List<Map<String, dynamic>> menuItems = [
    {'image': 'assets/images/fire.png', "text": 'POPULAR'},
    {'image': 'assets/images/starter.png', "text": 'STARTER'},
    {'image': 'assets/images/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/images/fast_food.png', "text": 'FAST FOOD'},
    {'image': 'assets/images/beverages.png', "text": 'BEVERAGES'},
    {'image': 'assets/images/dessert.png', "text": 'DESSERT'},
  ];
  List<List<Map<String, dynamic>>> itemsList = [];
  List<ScrollController> itemControllers = [];

  // bool isEnable = false;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    itemsList = List.generate(menuItems.length, (index) => menuItems);
    itemControllers =
        List.generate(menuItems.length, (index) => ScrollController());
    selectedIndex = 0; // Set the first index as the default selected index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        // backgroundColor: const Color(0xff26272C),
        backgroundColor: Colors.blueGrey.shade800,
        // foregroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'KDS',
              style: GoogleFonts.getFont('Poppins',
                  color: Colors.white, fontSize: 22),
            ),
          ],
        ),
        leadingWidth: 65,
        title: Padding(
          padding: const EdgeInsets.only(left: 120.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: 150,
            height: 35,
            child: Center(
              child: TextField(
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.black,
                ),
                //textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddToCart.routeName);
                  },
                  icon: const Icon(Icons.shopping_cart)),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 10),
                child: Badge(
                  backgroundColor: Colors.green,
                  label: Text('0',
                      style: GoogleFonts.getFont('Poppins', fontSize: 10)),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 100,
            // color: const Color.fromARGB(255, 156, 150, 150),
            color: Colors.blueGrey.shade600,
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    print(controller.position.maxScrollExtent.toString());
                    controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linearToEaseOut);
                    // controller.animateTo(controller.position.maxScrollExtent*double.parse('0.$index'), duration: const Duration(milliseconds: 500), curve: Curves.linearToEaseOut);

                    // itemControllers[index].animateTo(itemControllers[index].position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: index == selectedIndex
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.transparent,
                            ),
                            child: Transform.scale(
                              scale: 0.6,
                              child: Image.asset(
                                menuItems[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          menuItems[index]['text'],
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: menuItems.length,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ListView.separated(
                  separatorBuilder: (context, index) => Container(
                    height: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, itemIndex) {
                    bool isSelected =
                        singleItemIndex == itemIndex && singleCatIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            // If already selected, toggle visibility
                            singleItemIndex = null;
                            singleCatIndex = null;
                          } else {
                            // Otherwise, select the item
                            singleItemIndex = itemIndex;
                            singleCatIndex = index;
                          }
                        });
                      },
                      child: SizedBox(
                        // color: Colors.amber,
                        height: 170,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/pizza4.png',
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Extra Cheese Pizza',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '\$5',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected || countsList[index][itemIndex] > 0)
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    stops: const [0.01, 0.6],
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.transparent
                                    ],
                                  ),
                                ),
                              ),
                            if (isSelected || countsList[index][itemIndex] > 0)
                              Positioned(
                                bottom: 10,
                                left: 25,
                                right: 25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (countsList[index][itemIndex] >
                                              0) {
                                            countsList[index][itemIndex]--;
                                          }
                                        });
                                      },
                                      color: Colors.white,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          countsList[index][itemIndex]
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          countsList[index][itemIndex]++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
