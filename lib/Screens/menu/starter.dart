import 'package:flutter/material.dart';

class StarterScreen extends StatefulWidget {
    static const routeName = '/StarterScreen';

  const StarterScreen({super.key});

  @override
  State<StarterScreen> createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}