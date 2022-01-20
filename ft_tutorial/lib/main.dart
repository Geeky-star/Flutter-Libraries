import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

const entries = [
  [
    r'f8C6M$9tcY,FKOR*00%2RPNaaKjZUawdv#K4$Ps:HXELTJ,@XmS2=yxuNGn%IoR*',
    'https://drivetribe.imgix.net/fvHsAWZPQVah0hivwdPPtw?w=1600&h=1067&fm=webp&auto=compress&lossless=true&fit=crop&crop=faces',
    'LG6'
  ],
  [
    r'f86RZIxu4TITofx]jsaeayozofWB00RP?w%NayMxkDt8ofM_Rjt8_4tRD$IUWAxu',
    'https://drivetribe.imgix.net/G_Xtlr1RQXiEklCPX8auGw?w=2400&h=1350&fm=webp&auto=compress&lossless=true&fit=crop&crop=faces',
    'ED8'
  ],
  [
    r'LZG6p1{I^6rX}G=0jGR$Z|t7NLW,',
    'https://drivetribe.imgix.net/C8AqQLEWTMShpDF2QcABNQ?w=1600&h=1067&fm=webp&auto=compress&lossless=true&fit=crop&crop=faces',
    'MT2'
  ],
  [
    r'L371cr_3RKKFsqICIVNG00eR?d-r',
    'https://drivetribe.imgix.net/R7OHpnZoRvSvE5rB9ZaGrw?w=2400&h=1350&fm=webp&auto=compress&lossless=true&fit=crop&crop=faces',
    'TK1'
  ],
];

const duration = Duration(milliseconds: 500);

const radius = Radius.circular(16);

const topMark = .7;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: const BlurHashApp());
  }
}

class BlurHashApp extends StatefulWidget {
  const BlurHashApp({Key? key}) : super(key: key);

  @override
  _BlurHashAppState createState() => _BlurHashAppState();
}

class _BlurHashAppState extends State<BlurHashApp> {
  double progression = 0;

  void onStarted() {
    print("Ready");
  }

  double norm(double value, double min, double max) =>
      (value - min) / (max - min);

  @override
  Widget build(BuildContext context) =>
      NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notif) {
            setState(() {
              progression = norm(notif.metrics.pixels, 0, 1);
            });
            return true;
          },
          child: Stack(children: [
            FractionallySizedBox(
              heightFactor: topMark,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xEEFFFFFF), Color(0xCCFFFFFF)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-.8, -.5),
              child: Container(
                margin: EdgeInsets.only(top: 100),
                child: buildList(),
              ),
            ),
          ]));

  Widget buildList() {
    bool isInView = false;
    final gradient = ColorTween(begin: Color(0xFF222222), end: Colors.black87);

    double progression = 1;

    double base = progression / 100;
    final color = gradient.lerp(base);

    return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (ctx, idx) {
          return Container(
              padding: EdgeInsets.only(left: 0, right: 200),
              height: 510,
              margin: const EdgeInsets.only(bottom: 24),
              child: isInView || idx == 0
                  ? SynchronizedDisplay(
                      hash: entries[idx][0],
                      uri: entries[idx][1],
                      title: entries[idx][2])
                  : BlurHash(hash: entries[idx][0]));
        });
  }
}

class SynchronizedDisplay extends StatefulWidget {
  const SynchronizedDisplay(
      {Key? key, required this.hash, required this.uri, required this.title})
      : super(key: key);
  final String hash;
  final String uri;
  final String title;

  @override
  _SynchronizedDisplayState createState() => _SynchronizedDisplayState();
}

class _SynchronizedDisplayState extends State<SynchronizedDisplay>
    with SingleTickerProviderStateMixin {
  late Animation<double> animatedWidth;
  late AnimationController controller;

  double end = 100;

  @override
  Widget build(BuildContext context) {
    final w = animatedWidth.value;

    return Expanded(
      flex: 1,
      child: BlurHash(
        onStarted: onStarted,
        hash: widget.hash,
        image: widget.uri,
        duration: duration,
      ),
    );
  }

  void onStarted() {
    controller.forward();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: duration, vsync: this);
    final curved =
        CurvedAnimation(parent: controller, curve: Curves.easeOutCirc);
    animatedWidth = Tween<double>(begin: -50, end: end).animate(curved);
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
