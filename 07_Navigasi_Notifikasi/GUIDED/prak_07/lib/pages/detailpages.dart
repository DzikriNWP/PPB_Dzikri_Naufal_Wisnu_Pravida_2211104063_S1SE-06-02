import 'package:flutter/material.dart';

class Detailpages extends StatelessWidget {
  const Detailpages({super.key, required this.data});

  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: data,
      ),
    );
  }
}
