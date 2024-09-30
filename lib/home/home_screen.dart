import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nectar/add_screen/add_screen.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  static const route = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FileSystemEntity>? _savedVideos;
  @override
  void initState() {
    dataLoad();
    // TODO: implement initState
    super.initState();
  }

  void dataLoad() async {
    // final Directory directory = await getExternalStorageDirectory() ??
    //     await getApplicationDocumentsDirectory();

    // setState(() {
    //   _savedVideos = directory
    //       .listSync()
    //       .where((file) => file.path.endsWith('.mp4'))
    //       .toList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text("All documents"),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _savedVideos?.length,
              itemBuilder: (context, index) {
                return Text("${_savedVideos?.first.path.split(".mp4").first}");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AddScreen.route);
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(2, 2),
                  blurRadius: 10,
                ),
              ]),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
