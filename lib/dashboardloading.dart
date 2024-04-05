import 'package:flutter/material.dart';

class dashloading extends StatefulWidget{
  const dashloading({super.key});

  @override
  State<dashloading> createState() {
    return _dashloading();
  }

}

class _dashloading extends State<dashloading>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniBlind'),
      ),

      body: const Center(
        child: Text('Dashboard Loading....'),
      ),
    );
  }
}