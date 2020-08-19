import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
class Network{
  String url='https://api.covid19api.com/summary';
  Future getData() async
  {
    final response = await http.get(url.toString());
    if(response.statusCode==200)
      {
        print('success');
        return json.decode(response.body);
      }
    else
      {
        throw Exception('failed to retrieve');
      }
  }
  Future<List> add() async
  {
    List<String> some=List<String>();
    var data = await getData();
    for(var val in data['Countries'])
    {
      String temp= val['Country'];
     some.add(temp);
    //rint('her ${val['Country']} $some');
    }
    print('here list $some' );
    return some;
  }
  Future<String> getDate() async
  {
    var data = await getData();
    return data["Date"].toString().substring(0,10);
  }
  Future<dynamic> getValue(String countryName)async{
    var data = await getData();
    List caseValues;
//    var a = data['Countries'][2]['Country'];
//    print(a);
    for(var val in data['Countries'])
      {
       // print(val['Country']);
        if(countryName == val['Country'])
          {
//            caseValues[0] = val['TotalConfirmed'];
//            caseValues[1] = val["TotalDeaths"];
//            caseValues[2] = val['TotalRecovered'];
        return val;
            break;
          }
      }
    return caseValues;
}
}