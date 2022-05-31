import 'package:flutter/material.dart';
import 'package:internship_2/model/page_data.dart';
import 'package:internship_2/widget/item_card.dart';

class Screen2 extends StatefulWidget {
  const Screen2({required this.pageData, Key? key}) : super(key: key);
  final PageData pageData;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ItemCard(paageData: widget.pageData),
      ),
    );
  }
}
