import 'package:flutter/material.dart';
import 'count_clip.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderClipper(
              imagePath: 'assets/icons/coronadr.svg',
              text1: 'Get to know',
              text2: 'About Covid-19',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Symptoms',
                    style: kHeadingTextStyle.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Symptoms(
                        text: "Headache",
                        path: 'assets/images/headache.png',
                      ),
                      Symptoms(
                        text: "Caugh",
                        path: 'assets/images/caugh.png',
                      ),
                      Symptoms(
                        text: "Fever",
                        path: 'assets/images/fever.png',
                      ),
                    ],
                  ),
                  Text(
                    'Prevention',
                    style: kHeadingTextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Prevention(
                    heading: 'Wear Face Mask',
                    text:
                        'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks',
                    imagePath: 'assets/images/wear_mask.png',
                  ),

                  Prevention(
                    heading: 'Wash your Hands',
                    text:
                    'Wash your hands often ,to keep the virus away from you.',
                    imagePath: 'assets/images/wash_hands.png',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Prevention extends StatelessWidget {
  final String imagePath;
  final String heading;
  final String text;
  const Prevention({
    Key key,
    this.imagePath,
    this.heading,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 6),
            height: 136,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
          Image.asset(imagePath.toString()),
          Positioned(
            left: 130,
            child: Container(
              height: 136,
              width: MediaQuery.of(context).size.width - 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    heading.toString(),
                    style: kHeadingTextStyle.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Text(
                    text.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Symptoms extends StatelessWidget {
  final String path;
  final String text;
  const Symptoms({
    Key key,
    this.path,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 20,
              color: kActiveShadowColor,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Image.asset(path.toString()),
            Text(
              text.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
