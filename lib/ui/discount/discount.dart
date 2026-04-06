import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_ui/ui/home/home.dart';

class DiscountTab extends StatelessWidget {
  const DiscountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }
}

class DiscountTabPage extends StatefulWidget {
  const DiscountTabPage({super.key});

  @override
  State<DiscountTabPage> createState() => _DiscountTabPage();
}

class _DiscountTabPage extends State<DiscountTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();

  }
}

Widget getBody(){
  return SafeArea(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: const Center(
        child:CupertinoPageScaffold(
          child: Scaffold(
            body: DiscountTabPage(),
          ),
        )
      ),
    ),
  );
}