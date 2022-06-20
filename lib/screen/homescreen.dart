import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List animel_face = [
    "🐶",
    "🐰",
    "🐹",
    "🐵",
    "🦊",
    "🐮",
    "🐱",
    "🐯",
  ];

  List animel_visibility = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List answer = [
    "Dog",
    "Rabbit",
    "Ret",
    "Monkey",
    "Fox",
    "Cow",
    "Cat",
    "Tiger",
  ];

  List animel_name = [
    "Ret",
    "Cow",
    "Rabbit",
    "Dog",
    "Fox",
    "Monkey",
    "Tiger",
    "Cat"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("drag and drop"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: animel_face.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Draggable(
                    data: '${answer[index]}',
                    child: (animel_visibility[index] == false) ? Text(
                            "${animel_face[index]}",
                            style: const TextStyle(fontSize: 70),
                          ) : Container(),
                    feedback: Text(
                      "${animel_face[index]}",
                      style: const TextStyle(
                          fontSize: 70, decoration: TextDecoration.none),
                    ),
                    childWhenDragging: Container(),
                  ),
                  DragTarget(
                    builder: (context, _, __) {
                      return (animel_visibility[index] == false)
                          ? Container(
                              height: 35,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Text(
                                "${answer[index]}",
                                style: const TextStyle(fontSize: 15),
                              ),
                            )
                          : Container();
                    },
                    onAccept: (value) {
                      setState(() {
                        animel_face.removeAt(index);
                        answer.removeAt(index);
                        animel_visibility[index] = true;
                      });
                    },
                    onWillAccept: (value) {
                      return value == answer[index];
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
