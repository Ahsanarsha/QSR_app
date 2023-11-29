// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class PinScreen extends StatefulWidget {
//   const PinScreen({super.key});

//   @override
//   State<PinScreen> createState() => _PinScreenState();
// }

// class _PinScreenState extends State<PinScreen> {
//   List<String> pin = [
//     "1",
//     "2",
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 40,
//               ),
//               SizedBox(
//                 height: 50,
//                 child: TextFormField(
//                   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                   style: const TextStyle(
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     suffixIcon: Transform.scale(
//                       scale: 1.5,
//                       child: const Icon(
//                         Icons.keyboard_alt_outlined,
//                         color: Colors.white,
//                       ),
//                     ),
//                     hintText: 'PIN LOGIN',
//                     hintStyle: const TextStyle(color: Colors.white),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.white),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.white),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 40.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               GridView.builder(
//                 itemCount: pin.length,
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 0.9,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Card(
//                     color: Colors.grey,
//                     // elevation: 2,
//                     child: Center(
//                       child: Text(
//                         pin[index],
//                         style:
//                             const TextStyle(fontSize: 60, color: Colors.white),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               GridView(
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 0.9,
//                 ),
//                 children: [
//                   Card(
//                     color: Colors.red,
//                     child: GridTileofApp(
//                         isIcon: true, iconData: Icons.backspace_outlined),
//                   ),
//                   Card(
//                     color: Colors.grey,
//                     child: GridTileofApp(),
//                   ),
//                   Card(
//                     color: Colors.green[600],
//                     child: GridTileofApp(
//                       isIcon: true,
//                       iconData: Icons.login,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class GridTileofApp extends StatelessWidget {
//   GridTileofApp({
//     Key? key,
//     this.iconData = Icons.abc,
//     this.firstText = '0',
//     this.isIcon = false,
//   }) : super(key: key);

//   // ignore: prefer_typing_uninitialized_variables
//   IconData iconData;
//   String firstText;
//   final bool isIcon;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         isIcon
//             ? SizedBox(
//                 child: Icon(
//                   iconData,
//                   size: 45,
//                   color: Colors.white,
//                 ),
//               )
//             : Text(
//                 firstText,
//                 style: const TextStyle(fontSize: 60, color: Colors.white),
//               )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kds_app/Screens/home/home_screen.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController _pinController = TextEditingController();
  late bool pinLogin = false;
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff212129),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: isPortrait ? 150 : 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Login Via UserName',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    Checkbox(
                        fillColor: MaterialStatePropertyAll(Colors.white),
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                        value: pinLogin,
                        onChanged: (value) {
                          setState(() {
                            pinLogin = value!;
                          });
                        }),
                  ],
                ),
              ),
              if (!pinLogin) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    style: GoogleFonts.getFont(
                      'Poppins',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        label: Text(
                          'Username',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    style: GoogleFonts.getFont(
                      'Poppins',
                      color: Colors.white,
                    ),
                    obscureText: !_obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() {
                          _obscureText = !_obscureText;
                        }),
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      label: Text(
                        'Password',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                 const SizedBox(
                  height: 35,
                ),
                Container(
                  color: Colors.green,
                  height: 50,
                  
                  width: double.infinity,
                  child: ElevatedButton(
                    style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                    
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    child: const Text( 
                      'Log In',
                    ),
                  ),
                  
                ),
              ],
              if (pinLogin) ...[
                TextFormField(
                  readOnly: true,
                  controller: _pinController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: GoogleFonts.getFont(
                    'Poppins',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    suffixIcon: Transform.scale(
                      scale: 1.5,
                      child: const Icon(
                        Icons.keyboard_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: Transform.scale(
                      scale: 1.5,
                      child: const Icon(
                        Icons.keyboard_alt_outlined,
                        color: Color(0xff212129),
                      ),
                    ),
                    hintText: 'PIN LOGIN',
                    hintStyle: GoogleFonts.getFont('Poppins',
                        color: Colors.white, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: isPortrait ? 0 : 20),
                  ),
                ),
                SizedBox(height: isPortrait ? 20.0 : 10),
                Expanded(
                  child: GridView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isPortrait ? 3 : 6,
                      childAspectRatio: isPortrait ? 0.9 : 1.2,
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          onKeyPress(index);
                        },
                        child: Card(
                          color: Colors.grey,
                          //elevation: 5.0,
                          // margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: index == 9
                                ? const Icon(
                                    Icons.backspace_outlined,
                                    size: 40,
                                  )
                                : index == 11
                                    ? const Icon(
                                        Icons.login,
                                        size: 40,
                                      )
                                    : Text(
                                        index == 10 ? '0' : '${index + 1}',
                                        style: GoogleFonts.getFont('Poppins',
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void onKeyPress(int index) {
    setState(() {
      if (index == 9 && _pinController.text.isNotEmpty) {
        // Backspace pressed
        _pinController.text =
            _pinController.text.substring(0, _pinController.text.length - 1);
      } else if (index == 11) {
        // Login pressed
        // Add your navigation logic here
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else if (index == 0 ||
          index == 1 ||
          index == 2 ||
          index == 3 ||
          index == 4 ||
          index == 5 ||
          index == 6 ||
          index == 7 ||
          index == 8 ||
          index == 10) {
        // Number pressed
        _pinController.text += (index == 10) ? '0' : '${index + 1}';
      }
    });
  }
}
