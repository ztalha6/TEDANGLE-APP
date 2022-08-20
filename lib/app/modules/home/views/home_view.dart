import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tedangle/app/app_service.dart';
import 'package:tedangle/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? controller2;
  TextEditingController emailController = TextEditingController();

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

  Future<void> _loginUser(AppService appService, String email) async {
    await appService.signIn(email);
    setState(() {});
  }

  Future<void> _signOut(AppService appService) async {
    await appService.signOut();
    setState(() {});
  }

  Future<void> _displayTextInputDialog(
      BuildContext context, AppService appService,
      {bool isLogin = false}) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            content: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                suffix: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    isLogin
                        ? _loginUser(appService, emailController.text)
                        : appService.createUser(emailController.text);
                  },
                  child: const Icon(
                    Icons.send_rounded,
                    size: 20,
                    color: Color(0xFF142F43),
                  ),
                ),
                focusColor: const Color(0xFF142F43),
                hoverColor: const Color(0xFF142F43),
                filled: true,
                hintStyle: const TextStyle(color: Color(0xFFA6A6A6)),
                hintText: "Enter your email",
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final appService = Get.put(AppService());
    return Scaffold(
      backgroundColor: const Color(0xFF142F43),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF142F43),
        toolbarHeight: 100,
        title: Column(
          children: [
            const Text('TEDANGLE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(appService.getCurrentUserEmail(),
                style: TextStyle(fontSize: 14)),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
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
                    dashPattern: const [15],
                    radius: const Radius.circular(12),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                            // color: const Color(0xFF0C7D0D).withOpacity(0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(220))),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: controller2!,
                    child: Transform.translate(
                      offset: const Offset(60, -40),
                      child: Align(
                        // alignment: Alignment.topLeft,
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              color: Color(0xff112B3C)),
                          height: 75.0,
                          width: 75.0,
                          child: Image.asset('assets/java.png'),
                        ),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: controller2!,
                    child: Transform.translate(
                      offset: const Offset(-10, 70),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Color(0xff112B3C)),
                        height: 75.0,
                        width: 75.0,
                        child: Image.asset('assets/python.png'),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: controller2!,
                    child: Transform.translate(
                      offset: const Offset(-60, -40),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Color(0xff112B3C),
                        ),
                        height: 80.0,
                        width: 80.0,
                        child: Image.asset('assets/kotlin.png'),
                      ),
                    ),
                  ),
                ],
              ),
              DottedBorder(
                color: Colors.white,
                borderType: BorderType.Circle,
                dashPattern: const [15],
                radius: const Radius.circular(12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                        // color: const Color(0xFF0C7D0D).withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(220))),
                  ),
                ),
              ),
              RotationTransition(
                turns: controller!,
                child: Transform.translate(
                  offset: const Offset(-150, 0),
                  child: Align(
                    // alignment: Alignment.topLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Color(0xff112B3C)),
                      height: 75.0,
                      width: 75.0,
                      child: Image.asset('assets/react.png'),
                    ),
                  ),
                ),
              ),
              RotationTransition(
                turns: controller!,
                child: Transform.translate(
                  offset: const Offset(150, -0),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Color(0xff112B3C)),
                    height: 75.0,
                    width: 75.0,
                    child: Image.asset('assets/nodejs.png'),
                  ),
                ),
              ),
              RotationTransition(
                turns: controller!,
                child: Transform.translate(
                  offset: const Offset(0, -150),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Color(0xff112B3C)),
                    height: 75.0,
                    width: 75.0,
                    child: Image.asset('assets/flutter.png'),
                  ),
                ),
              ),
              RotationTransition(
                turns: controller!,
                child: Transform.translate(
                  offset: const Offset(0, 150),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Color(0xff112B3C),
                    ),
                    height: 75.0,
                    width: 75.0,
                    child: Image.asset('assets/javascript.png'),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          // TextButton(
          //     onPressed: () => appService.createUsers(),
          //     child: const Text(
          //       'Create users',
          //       style: TextStyle(color: Colors.white),
          //     )),

          Visibility(
            visible: appService.getCurrentUserEmail().isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: RaisedButton(
                onPressed: () {
                  Get.toNamed(Routes.CHAT);
                },
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "CHAT ROOM",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: appService.getCurrentUserEmail().isNotEmpty,
            child: RaisedButton(
              onPressed: () {
                _signOut(appService);
              },
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "SIGN OUT",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),

          Visibility(
            visible: appService.getCurrentUserEmail().isEmpty,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: RaisedButton(
                onPressed: () {
                  _displayTextInputDialog(context, appService, isLogin: true);
                },
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),

          Visibility(
            visible: appService.getCurrentUserEmail().isEmpty,
            child: RaisedButton(
              onPressed: () {
                _displayTextInputDialog(context, appService);
                // Get.toNamed(Routes.CHAT);
              },
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
