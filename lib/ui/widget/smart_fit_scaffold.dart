
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartFitScaffold extends StatelessWidget {
  const SmartFitScaffold({
    super.key,
    required this.title,
    required this.body,
    this.isLeading = true,
    this.actions,
    this.drawer,
    this.bottoms,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  final String title;
  final bool isLeading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottoms;

  final Widget? body;

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: FittedBox(child: Text(
              title,
              style: const TextStyle(color: Colors.black)
          )),
          actions: actions,
          bottom: bottoms,
          automaticallyImplyLeading: isLeading,
          leading: const BackButton(
            color: Colors.black, // <-- SEE HERE
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Get.theme.colorScheme.background,
          height: double.infinity,
          width: double.infinity,
          child: body,
        ),
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      )
    ]);
  }
}
