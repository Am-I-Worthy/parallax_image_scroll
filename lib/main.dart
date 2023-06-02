import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax Image Scroll',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imagesUrl = [
    'https://pixabay.com/get/gb063ed30bba1f2d2595b667c00794315e45f93857d36967f94ded3c68b6d520d2c04d826448db59979cc400e3f760765_1920.jpg',
    'https://pixabay.com/get/g66cc26546dea670420152782f358f26aad4d07676832a65ba483d64c5d6c40e260f38fd694dc84f4400c889b92de27e2_1920.jpg',
    'https://pixabay.com/get/g830e84d2edaa6849c054b42098cce30f4e4861b8a6f0103eb2e5f2a0f60285187aa2f0dc0369ec0353e558ef2ea9ec28_1920.jpg',
    'https://pixabay.com/get/g8eccbb6da5c31005c7f145f6cf317bfdb56853e8d83b74f10f063f521983bbadce37e815f7d768aa65abd8757f4c3147_1920.jpg',
    'https://pixabay.com/get/g0ee010c0a1f88b8bc8640d77067178447999854c5f2b83a60014c3d9d8213bb4ce1aaa6bb3f8a850b25c7b5ac0a87afd_1920.jpg',
  ];

  List<String> texts = [
    'This',
    'Parallax Scroll',
    'Looks Amazing!',
    'Right...!',
    'Let Us Know in the Comments :D'
  ];

  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: controller,
        itemCount: imagesUrl.length,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                        0.0,
                        controller.hasClients
                            ? (-(index * MediaQuery.of(context).size.height) +
                                    controller.position.pixels) /
                                2
                            : 0.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/${index + 1}.jpg',
                    // imagesUrl[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                    child: Text(
                  texts[index],
                  style: GoogleFonts.kaushanScript(
                    fontSize: 100.0,
                    color: Colors.white,
                  ),
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}
