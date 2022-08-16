import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? controller2;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    controller2 = AnimationController(vsync: this);
    controller!.repeat(
      // min: 0.0,
      // max: 1.0,
      period: const Duration(seconds: 20),
      // reverse: true,
    );
    controller2!.repeat(
      // min: 0.0,
      // max: 1.0,
      period: const Duration(seconds: 7),
      // reverse: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF142F43),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF142F43),
        toolbarHeight: 100,
        title: const Text('TEDANGLE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  DottedBorder(
                    color: Colors.white,
                    borderType: BorderType.Circle,
                    dashPattern: [15],
                    radius: Radius.circular(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            // color: const Color(0xFF0C7D0D).withOpacity(0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(220))),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: controller2!,
                    child: Transform.translate(
                      offset: Offset(60, -40),
                      child: Align(
                        // alignment: Alignment.topLeft,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Colors.green,
                          ),
                          height: 70.0,
                          width: 70.0,
                        ),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: controller2!,
                    child: Transform.translate(
                      offset: Offset(-10, 70),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.green,
                        ),
                        height: 70.0,
                        width: 70.0,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: controller2!,
                    child: Transform.translate(
                      offset: Offset(-60, -40),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Colors.green,
                        ),
                        height: 70.0,
                        width: 70.0,
                      ),
                    ),
                  ),
                ],
              ),
              DottedBorder(
                color: Colors.white,
                borderType: BorderType.Circle,
                dashPattern: [15],
                radius: Radius.circular(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        // color: const Color(0xFF0C7D0D).withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(220))),
                  ),
                ),
              ),
              RotationTransition(
                turns: controller!,
                child: Transform.translate(
                  offset: Offset(-150, 0),
                  child: Align(
                    // alignment: Alignment.topLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.green,
                      ),
                      height: 70.0,
                      width: 70.0,
                    ),
                  ),
                ),
              ),
              RotationTransition(
                turns: controller!,
                child: Transform.translate(
                  offset: Offset(150, -0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.green,
                    ),
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
              ),
              RotationTransition(
                turns: controller!,
                child: Transform.translate(
                  offset: Offset(0, -150),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.green,
                    ),
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
              ),
              RotationTransition(
                turns: controller!,
                child: Transform.translate(
                  offset: Offset(0, 150),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.green,
                    ),
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          RaisedButton(
            onPressed: () {},
            color: Colors.amber,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Find Developers",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
