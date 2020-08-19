import 'package:flutter/material.dart';
import 'constants.dart';
import 'count_clip.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'info_screen.dart';
import 'networking.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dropdownValue = 'India';
  String dateValue;
  List<String> dropValues = [null];
  Network network = Network();
  int infected,deaths,recovered;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hello');
    getResp();
    getDate();
  }
  Future getResp() async{
    await getNumber();
    List<String> values=await network.add();
    setState(() {
      dropValues= values;
    });

   // print(data);
  }
  Future getDate()async{
    String temp = await network.getDate();
    setState(() {
      dateValue =  temp;
    });
  }
  Future getNumber() async
  {
    var totalCounts = await network.getValue(dropdownValue);
  setState(() {
    recovered = totalCounts['TotalRecovered'];
    deaths = totalCounts["TotalDeaths"];
    infected = totalCounts["TotalConfirmed"];
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderClipper(
              text1: 'All you need',
              text2: 'is stay at home.',
              imagePath: 'assets/icons/Drcorona.svg',
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.blue[200],
                  )),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: dropValues[0],
                        isExpanded: true,
                        // elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        underline: Container(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            print(dropdownValue);
                            getNumber();
                          });
                        },
                        items: dropValues.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              '$value',
                              style: TextStyle(
                                  color: CupertinoColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Case Update\n',
                            style: kTitleTextstyle,
                          ),
                          TextSpan(
                            text: 'Newest updated on $dateValue',
                            style: TextStyle(color: kTextLightColor),
                          ),
                        ]),
                      ),
                      Text(
                        'See details',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    //blurRadius: 30,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  NumberOfCases(
                    number: infected,
                    color: kInfectedColor,
                    title: 'Infected',
                  ),
                  NumberOfCases(
                    number: deaths,
                    color: kDeathColor,
                    title: 'Deaths',
                  ),
                  NumberOfCases(
                    number: recovered,
                    color: kRecovercolor,
                    title: 'Recovered',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Spread of Virus',
                  style: kTitleTextstyle,
                ),
                Text(
                  'See Details',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(2),
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        //color: kShadowColor,
                        blurRadius: 5,
                        color: kPrimaryColor),
                  ]),
              child: Image.asset(
                'assets/images/map.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


