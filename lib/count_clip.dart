import 'package:flutter/material.dart';
import 'package:flutter_app_covid_19/info_screen.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
class NumberOfCases extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const NumberOfCases({
    Key key, this.number, this.color, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape:BoxShape.circle,
            color: color.withOpacity(.4),
          ),
          child:Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:Colors.transparent,
                border:Border.all(
                  color: color,
                  width: 2,
                )
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text('$number',
          style: TextStyle(
            color: kInfectedColor,
            fontSize: 30,
          ),),
        Text('$title',
          style: kSubTextStyle.copyWith(fontSize: 12),)
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class HeaderClipper extends StatelessWidget {
  final String text1, text2;
  final String imagePath;
  const HeaderClipper({Key key, this.text1, this.text2, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 340,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ],
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/virus.png'),
            )),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InfoScreen()));
                    },
                    child: SvgPicture.asset("assets/icons/menu.svg")),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 70, 0),
                    child: SvgPicture.asset(
                      '$imagePath',
                      fit: BoxFit.fitWidth,
                      width: 230,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 180,
                    child: Text(
                      '$text1 \n$text2',
                      style: kHeadingTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 400,
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