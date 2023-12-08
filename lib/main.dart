import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

List<Color> colors = [
  const Color(0xFFC40E1E),
  Colors.yellow,
  Colors.purple,
  Colors.grey,
  Colors.indigo,
  Colors.amber,
  Colors.white,
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        colorSchemeSeed: const Color(0xFF2A0920),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      home: Title(
        title: "YEAR AND PARTY TREE",
        color: const Color(0xFF2A0920),
        child: Scaffold(
          backgroundColor: const Color(0xFF2A0920),
          body: LayoutBuilder(builder: (context, constraints) {
            return SafeArea(
              child: Center(
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: const FittedBox(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [DynamicTreeWidget(), DynamicCodeTextWidget()],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DynamicTreeWidget extends StatefulWidget {
  const DynamicTreeWidget({super.key});

  @override
  State<DynamicTreeWidget> createState() => _DynamicTreeWidgetState();
}

class _DynamicTreeWidgetState extends State<DynamicTreeWidget> {
  int len = 15;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i < len; i++) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = len - 1; i < j; j--)
                        const Text("*",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.transparent,
                              height: 1.1,
                            )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int j = 0; j < 2 * i - 1; j++) ...[
                        if (i != 1 && j.isOdd) ...[
                          if (Random().nextBool())
                            Text(
                              "o",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: colors[Random().nextInt(max(colors.length - 1, 1))],
                                height: 1.1,
                              ),
                            )
                          else
                            const Text(
                              "*",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF12A10D),
                                height: 1.1,
                              ),
                            )
                        ] else ...[
                          const Text(
                            "*",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF12A10D),
                              height: 1.1,
                            ),
                          )
                        ],
                      ]
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
        const Text("mWm\nmWm\nmWm\nmWm\n",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFFC19B00), height: 1)),
      ],
    );
  }
}

int loveCnt = 0;

class DynamicCodeTextWidget extends StatefulWidget {
  const DynamicCodeTextWidget({super.key});

  @override
  State<DynamicCodeTextWidget> createState() => _DynamicCodeTextWidgetState();
}

class _DynamicCodeTextWidgetState extends State<DynamicCodeTextWidget> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (loveCnt > 8) ...[
          const Text("MERRY CHRISTMAS, unione!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF12A10D))),
        ] else ...[
          const Text("MERRY CHRISTMAS!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFFC40E1E))),
        ],
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            loveCnt++;

            if (loveCnt == 9) {
              setState(() {});
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("With lots of ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFFC40E1E))),
              if (loveCnt > 8) ...[
                Text("LOVE",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)))
              ] else ...[
                Text(
                  "S",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
                Text(
                  "P",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
                Text(
                  "A",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
                Text(
                  "G",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
                Text(
                  "H",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
                Text(
                  "E",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
                Text(
                  "T",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
                Text(
                  "T",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
                Text(
                  "I",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700, color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
