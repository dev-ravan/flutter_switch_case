import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple[600],
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple[600],
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const SwitchCaseFlutter(),
    );
  }
}

class SwitchCaseFlutter extends StatefulWidget {
  const SwitchCaseFlutter({super.key});

  @override
  State<SwitchCaseFlutter> createState() => _SwitchCaseFlutterState();
}

enum ColorContainer { red, green, blue, pink }

Widget container({required Color pickColor}) {
  return Container(
    height: 250,
    width: 250,
    color: pickColor,
  );
}

Widget getColorContainer({required selectContainer}) {
  switch (selectContainer) {
    case ColorContainer.blue:
      return container(pickColor: Colors.blue);
    case ColorContainer.green:
      return container(pickColor: Colors.green);
    case ColorContainer.pink:
      return container(pickColor: Colors.pink);
    case ColorContainer.red:
      return container(pickColor: Colors.red);
  }
  return container(pickColor: Colors.blue);
}

class _SwitchCaseFlutterState extends State<SwitchCaseFlutter> {
  ColorContainer selectedContainer = ColorContainer.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("F L U T T E R  S W I T C H  C A S E"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getColorContainer(selectContainer: selectedContainer),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedContainer = ColorContainer.blue;
                    });
                  },
                  child: const Text("B L U E"),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedContainer = ColorContainer.green;
                      });
                    },
                    child: const Text("G R E E N")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedContainer = ColorContainer.red;
                      });
                    },
                    child: const Text("R E D")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedContainer = ColorContainer.pink;
                      });
                    },
                    child: const Text("P I N K")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
